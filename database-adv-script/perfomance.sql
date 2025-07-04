-- Step 1: Initial Complex Query (with WHERE and AND for filtering)
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.payment_method,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE p.location = 'Lagos'
  AND b.start_date >= '2024-01-01';

-- Step 2: EXPLAIN Query to Analyze Performance
EXPLAIN
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.payment_method,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE p.location = 'Lagos'
  AND b.start_date >= '2024-01-01';

-- Step 3: Optimized Query (indexes assumed added)
-- Indexes that support this query:
-- - idx_property_location on properties(location)
-- - idx_booking_start_date on bookings(start_date)

SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.payment_method,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE p.location = 'Lagos'
  AND b.start_date >= '2024-01-01';
