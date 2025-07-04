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

--
