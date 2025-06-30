-- 1. INNER JOIN: Get all bookings with user details
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
ORDER BY b.created_at DESC;

-- --------------------------------------------------------

-- 2. LEFT JOIN: Get all properties with their reviews (if any)
SELECT 
    p.property_id,
    p.name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.created_at DESC;

-- --------------------------------------------------------

-- 3. FULL OUTER JOIN: Get all users and bookings, even unmatched
SELECT 
    u.user_id,
    u.first_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.status
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id
ORDER BY u.created_at NULLS LAST, b.created_at NULLS LAST;
