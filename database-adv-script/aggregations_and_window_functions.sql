-- 1. Aggregation: Bookings per user
SELECT 
    u.user_id,
    u.first_name || ' ' || u.last_name AS user_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC;

-- 2. Window Function: Property booking rankings
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_num
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.location
ORDER BY 
    booking_count DESC;
