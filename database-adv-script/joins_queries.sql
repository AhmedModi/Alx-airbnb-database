-- 1. INNER JOIN: Bookings with their users
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name || ' ' || u.last_name AS guest_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id
ORDER BY 
    b.start_date DESC;

-- 2. LEFT JOIN: Properties with all reviews (including those without reviews)
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id
ORDER BY 
    p.property_id, r.created_at DESC;

-- 3. FULL OUTER JOIN: All users and all bookings
SELECT 
    COALESCE(u.user_id, b.user_id) AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    users u
FULL OUTER JOIN 
    bookings b ON u.user_id = b.user_id
WHERE 
    u.user_id IS NULL OR b.booking_id IS NULL  -- Show only unmatched records
    OR u.user_id = b.user_id                   -- Include matched records
ORDER BY 
    u.last_name, b.start_date;
