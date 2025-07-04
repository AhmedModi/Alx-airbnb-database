# SQL Joins Documentation

## Query Explanations

### 1. INNER JOIN (Bookings + Users)
- **Purpose**: Find all bookings with guest details
- **Tables Joined**: `bookings` ↔ `users`
- **Key Fields**: `user_id` as the foreign key
- **Output**: Booking details with guest names/emails
- **Note**: Excludes bookings without users (shouldn't exist with proper FK constraints)

### 2. LEFT JOIN (Properties + Reviews)
- **Purpose**: Show all properties including those without reviews
- **Tables Joined**: `properties` ← `reviews`
- **Key Fields**: `property_id`
- **Output**: Property details with review data (NULL for unreviewed properties)
- **Usage**: Helps identify properties needing more reviews

### 3. FULL OUTER JOIN (Users + Bookings)
- **Purpose**: Audit user-booking relationships
- **Tables Joined**: `users` ↔ `bookings`
- **Key Fields**: `user_id`
- **Output**:
  - Users without bookings
  - Bookings without valid users (orphaned records)
  - Normal user-booking pairs
- **Business Value**: Detects data integrity issues

## Performance Considerations
- Indexes should exist on all join fields (`user_id`, `property_id`)
- For large datasets, consider adding:
  ```sql
  CREATE INDEX idx_bookings_user ON bookings(user_id);
  CREATE INDEX idx_reviews_property ON reviews(property_id);
