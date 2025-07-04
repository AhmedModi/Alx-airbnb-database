-- Step 1: Initial Complex Query
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
JOIN payments pay ON b.payment_id = pay.id;

-- Step 2: EXPLAIN Query to Analyze Performance
EXPLAIN SELECT
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
JOIN payments pay ON b.payment_id = pay.id;

-- Step 3: Optimized Version (after adding indexes or improving logic)
-- Indexes assumed added:
-- CREATE INDEX idx_user_id ON bookings(user_id);
-- CREATE INDEX idx_property_id ON bookings(property_id);
-- CREATE INDEX idx_payment_id ON bookings(payment_id);

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
JOIN payments pay ON b.payment_id = pay.id;
