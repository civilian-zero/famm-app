# Feature Review Prompt

You are reviewing a proposed feature for Famm.

Famm is a fitness application built on top of a broader relationship-commerce platform.

Review the feature using the following framework.

## Feature Summary

Summarize the feature in one paragraph.

## Layer Decision

Classify this feature as:

- Platform Core
- Famm Application Layer
- User Experience Layer

## Reusability Test

Could this feature be reused by:

- Therapists
- Music teachers
- Tutors
- Tattoo artists
- Coaches
- Consultants

If yes, recommend a platform abstraction.

## Platform Primitive Mapping

Map the feature to existing platform primitives:

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

## Required Data

List required entities, fields, and relationships.

## Required APIs

List required commands, queries, and endpoints.

## Required Events

List domain events emitted by this feature.

## Permissions

Define who can create, read, update, delete, approve, invite, cancel, refund, or archive.

## Analytics

Define product events that should be tracked.

## Risks

Identify risks related to:

- Platform leakage
- Fitness-specific assumptions
- Data model rigidity
- Commerce complexity
- Notifications
- Privacy
- Scale
- Future AI agents

## Recommendation

Provide an implementation recommendation.
