# Optimization Report: Complex Query Refactoring

## Initial Query Overview
The initial query retrieves all bookings along with user, property, and payment details. It joins four tables: `bookings`, `users`, `properties`, and `payments`.

## Performance Analysis
Using `EXPLAIN`, the query showed:
- Full table scans on `bookings`, `users`, `properties`, and `payments`
- No indexes used on `user_id`, `property_id`, or `payment_id`
- High row count on join operations

## Optimization Approach
To improve performance:
- Added indexes to foreign key columns in `bookings`:
  - `user_id`
  - `property_id`
  - `payment_id`
- This allows the MySQL query planner to use indexes for faster lookups and reduce full scans.

## Result
After adding indexes, `EXPLAIN` showed:
- Join operations used `ref` type instead of `ALL`
- Number of rows scanned reduced significantly
- Overall query execution time improved

## Final Notes
Further improvements can be made by:
- Using pagination (`LIMIT`)
- Fetching only needed columns
- Considering materialized views or caching for high-traffic systems
