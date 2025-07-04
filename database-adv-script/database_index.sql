-- Step 1: Create Indexes
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_payment_id ON bookings(payment_id);
CREATE INDEX idx_start_date ON bookings(start_date);
CREATE INDEX idx_location ON properties(location);

-- Step 2: Analyze Query Performance with EXPLAIN ANALYZE
EXPLAIN ANALYZE
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
