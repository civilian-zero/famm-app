# Pull Request Platform Review

You are reviewing this pull request as Chief Platform Architect.

The product is Famm, but the company is building a broader multi-tenant relationship-commerce platform.

Review the pull request for the following:

## 1. Layer Violations

Does this PR put platform logic inside the Famm application layer?

Does it put Famm-specific logic inside platform-core?

## 2. Naming Problems

Identify names that are too fitness-specific for the platform layer.

## 3. Data Model Problems

Identify whether any new tables, models, fields, or relationships should be generalized.

## 4. API Problems

Identify whether this PR creates screen-specific APIs instead of reusable platform APIs.

## 5. Event Problems

Identify missing domain events.

## 6. Permission Problems

Identify missing tenant, role, ownership, or access-control checks.

## 7. Test Problems

Identify missing unit tests, integration tests, permission tests, or event tests.

## 8. Documentation Problems

Identify whether this PR requires an ADR, API standard update, or data model documentation update.

## 9. Final Verdict

Return one of:

- Approve
- Approve with comments
- Request changes

Explain why.
