# Data Model Review Prompt

You are reviewing a proposed data model for a multi-tenant relationship-commerce platform.

The current app, Famm, serves fitness professionals, but the platform must eventually support therapists, tutors, music teachers, tattoo artists, coaches, consultants, creators, and other service professionals.

Review the proposed schema using the following framework.

## 1. Entity Classification

For each entity, classify it as:

- Platform Primitive
- Application-Specific Entity
- Join Table
- Event Table
- Analytics Table
- External Integration Table

## 2. Platform Primitive Mapping

Before approving a new entity, determine whether it should instead be represented as:

- User
- Organization
- Community
- Relationship
- Activity
- Offer
- Transaction
- Conversation
- Referral
- Affiliate
- Event
- ReputationSignal

## 3. Naming Review

Identify names that are too fitness-specific.

Examples:

- trainer
- client
- session
- workout
- gym
- package
- membership

Recommend industry-neutral alternatives where appropriate.

Examples:

- provider
- customer
- activity
- location
- offer
- subscription
- entitlement

## 4. Multi-Tenant Review

Confirm that every tenant-sensitive table includes:

- tenant_id or organization_id
- created_at
- updated_at
- created_by when appropriate
- deleted_at when soft deletion is needed

## 5. Relationship Review

Identify whether the model supports:

- One-to-one relationships
- One-to-many relationships
- Many-to-many relationships
- Follow relationships
- Referral relationships
- Membership relationships
- Community participation
- Business-to-provider relationships
- Provider-to-customer relationships
- Customer-to-customer relationships

## 6. Commerce Review

Identify whether the schema supports:

- One-time purchases
- Subscriptions
- Packages
- Credits
- Memberships
- Refunds
- Discounts
- Affiliate commissions
- Referral attribution
- Revenue share

## 7. Event Review

Recommend domain events that should be emitted when records are created, updated, deleted, or completed.

Use this format:

Entity:
Trigger:
Domain Event:
Payload:
Consumers:

## 8. Risk Assessment

Identify schema decisions that may create future migration pain.

## 9. Final Recommendation

Approve, reject, or revise the model.
