**Key Design Decisions:**

1. **Primary Keys**:
   - All tables use UUIDs for primary keys
   - Auto-generated using `uuid_generate_v4()` (PostgreSQL) or equivalent in other DBMS

2. **Foreign Keys**:
   - All reference other tables with `ON DELETE CASCADE` to maintain referential integrity
   - Example: Deleting a user automatically deletes their properties/bookings

3. **Constraints**:
   - `NOT NULL` for required fields
   - `ENUM` types for restricted values (status, roles, payment methods)
   - `CHECK` constraints for rating (1-5) and date validation

4. **Indexes**:
   - Created on all foreign keys for join performance
   - Added on frequently queried columns (email, dates, statuses)
   - Composite index on booking dates for range queries

5. **Data Types**:
   - `DECIMAL(10,2)` for monetary values
   - `TIMESTAMP` for all datetime fields
   - Appropriate VARCHAR lengths based on expected data
