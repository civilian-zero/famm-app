# Pull Request Review

## Summary

What does this PR change?

## Layer Classification

Select one:

- [ ] Platform Core
- [ ] Famm Application Layer
- [ ] User Experience Layer
- [ ] Documentation
- [ ] Infrastructure

## Platform Primitive Affected

Select all that apply:

- [ ] User
- [ ] Organization
- [ ] Community
- [ ] Relationship
- [ ] Activity
- [ ] Offer
- [ ] Transaction
- [ ] Conversation
- [ ] Referral
- [ ] Affiliate
- [ ] Event
- [ ] ReputationSignal
- [ ] None

## Industry-Specific Assumptions

Does this PR introduce assumptions specific to fitness, trainers, gyms, workouts, sessions, packages, or memberships?

Explain:

## API Review

Does this PR expose or change an API?

- [ ] Yes
- [ ] No

If yes, describe the command, query, or endpoint.

## Event Review

Does this PR emit or consume domain events?

- [ ] Yes
- [ ] No

If yes, list them.

## Data Model Review

Does this PR create or change database tables, fields, or relationships?

- [ ] Yes
- [ ] No

If yes, explain why the model is platform-safe.

## Permissions Review

Does this PR affect user permissions, tenant ownership, or access control?

- [ ] Yes
- [ ] No

If yes, explain the permission model.

## Cross-Industry Reuse

Could this capability support at least three of the following?

- Therapists
- Music teachers
- Tutors
- Tattoo artists
- Coaches
- Consultants
- Creators

Explain:

## Tests

- [ ] Unit tests added or updated
- [ ] Integration tests added or updated
- [ ] Permission tests added or updated
- [ ] Event tests added or updated
- [ ] Not applicable

## Documentation

- [ ] README updated
- [ ] ADR added or updated
- [ ] API docs updated
- [ ] Data model docs updated
- [ ] Not applicable

## AI Review

Paste the result of running:

`.ai/prompts/pr-review.md`

## Final Checklist

- [ ] This does not put Famm-specific logic into platform-core.
- [ ] This does not duplicate platform primitives inside famm-app.
- [ ] This preserves future API access.
- [ ] This supports future AI agents.
- [ ] This does not create avoidable rebuild risk.
