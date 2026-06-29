# Database Migration Review

You are reviewing a database migration for a multi-tenant relationship-commerce platform.

Evaluate the migration for:

## 1. Tenant Safety

Does every tenant-sensitive table include tenant ownership?

## 2. Backward Compatibility

Could this migration break existing application behavior?

## 3. Rollback Safety

Can this migration be rolled back safely?

## 4. Naming

Are the table and field names platform-neutral?

## 5. Indexing

Are indexes needed for:

- tenant_id
- user_id
- organization_id
- status
- created_at
- event time
- relationship lookups
- transaction lookups
- referral attribution

## 6. Auditability

Does the migration support audit trails where needed?

## 7. Privacy

Does this migration expose personally identifiable information, health-adjacent information, payment data, or private communications?

## 8. Events

What domain events are affected by this migration?

## 9. Recommendation

Approve, revise, or reject the migration.
