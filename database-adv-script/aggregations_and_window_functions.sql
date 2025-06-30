-- 1. Total number of bookings made by each user (Aggregation)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- --------------------------------------------------------

-- 2. RANK(): Rank properties based on total number of bookings
SELECT 
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b ON p.property_id = b.property_id
    GROUP BY p.property_id
) AS booking_counts;

-- --------------------------------------------------------

-- 3. ROW_NUMBER(): Strictly number properties by bookings, no ties
SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_row_number
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b ON p.property_id = b.property_id
    GROUP BY p.property_id
) AS booking_counts;
