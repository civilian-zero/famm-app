#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RULESET_FILE="${ROOT_DIR}/.github/rulesets/main-protection.json"
TOKEN="${GITHUB_TOKEN:-${GH_TOKEN:-}}"

if [[ -z "${TOKEN}" && -f "${ROOT_DIR}/.github-token" ]]; then
  TOKEN="$(tr -d '\n' < "${ROOT_DIR}/.github-token")"
fi

if [[ -z "${TOKEN}" ]]; then
  echo "Error: set GITHUB_TOKEN or GH_TOKEN with repo Administration (write) permission." >&2
  exit 1
fi

REMOTE_URL="$(git -C "${ROOT_DIR}" remote get-url origin)"
if [[ "${REMOTE_URL}" =~ github\.com[:/]([^/]+)/([^/.]+)(\.git)?$ ]]; then
  OWNER="${BASH_REMATCH[1]}"
  REPO="${BASH_REMATCH[2]}"
else
  echo "Error: could not parse owner/repo from origin remote." >&2
  exit 1
fi

AUTH=(-H "Authorization: Bearer ${TOKEN}" -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28")
API="https://api.github.com/repos/${OWNER}/${REPO}/rulesets"

apply_ruleset() {
  local existing_id response
  existing_id="$(
    curl -sS "${AUTH[@]}" "${API}" \
      | python3 -c 'import json,sys; data=json.load(sys.stdin); rulesets=data if isinstance(data,list) else []; print(next((str(r["id"]) for r in rulesets if r.get("name")=="main-protection"), ""))'
  )"

  if [[ -n "${existing_id}" ]]; then
    echo "Updating existing ruleset ${existing_id}..." >&2
    response="$(
      curl -sS -X PUT "${AUTH[@]}" \
        -H "Content-Type: application/json" \
        --data-binary "@${RULESET_FILE}" \
        "${API}/${existing_id}"
    )"
  else
    echo "Creating main-protection ruleset..." >&2
    response="$(
      curl -sS -X POST "${AUTH[@]}" \
        -H "Content-Type: application/json" \
        --data-binary "@${RULESET_FILE}" \
        "${API}"
    )"
  fi

  printf '%s' "${response}"
}

response="$(apply_ruleset)"
if echo "${response}" | python3 -c 'import json,sys; r=json.load(sys.stdin); sys.exit(0 if "id" in r else 1)' 2>/dev/null; then
  echo "${response}" | python3 -m json.tool
else
  echo "${response}" | python3 -m json.tool >&2 || echo "${response}" >&2
  echo >&2
  echo "Error: could not apply ruleset." >&2
  echo "Fine-grained PATs need Repository permissions -> Administration: Read and write." >&2
  echo "Create a new token at https://github.com/settings/tokens?type=beta" >&2
  exit 1
fi

echo "Configuring merge methods for linear history..."
curl -sS -X PATCH "${AUTH[@]}" \
  -H "Content-Type: application/json" \
  -d '{"allow_merge_commit":false,"allow_squash_merge":true,"allow_rebase_merge":true}' \
  "https://api.github.com/repos/${OWNER}/${REPO}" \
  > /dev/null

echo "Branch protection rules applied to ${OWNER}/${REPO} (main)."
