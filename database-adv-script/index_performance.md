# Index Performance Report

## Objective
To improve the performance of queries involving users, bookings, and properties by identifying frequently used columns and adding appropriate indexes.

## Identified High-Usage Columns
- `bookings.user_id`, `property_id`, `payment_id`, `start_date`: Used in JOIN and WHERE clauses
- `properties.location`: Used in filtering or searching properties
- `users.id`: Primary key used in joins

## Indexes Created
```sql
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_payment_id ON bookings(payment_id);
CREATE INDEX idx_start_date ON bookings(start_date);
CREATE INDEX idx_location ON properties(location);
