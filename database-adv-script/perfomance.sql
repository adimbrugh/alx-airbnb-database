-- 1. Initial Complex Query (Unoptimized)
-- Retrieves bookings with full user, property, and payment details
-- Includes WHERE condition to only fetch confirmed bookings from 2024 onward

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= '2024-01-01'
ORDER BY b.created_at DESC;

-- ------------------------------------------------------

-- Analyze with EXPLAIN
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= '2024-01-01'
ORDER BY b.created_at DESC;

-- ------------------------------------------------------

-- 2. Refactored Query (Optimized)
-- Reduces joined fields, combines user name, applies WHERE filters efficiently

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    CONCAT(u.first_name, ' ', u.last_name) AS user_full_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= '2024-01-01'
ORDER BY b.created_at DESC;





-- Query 1: Total bookings by user
EXPLAIN ANALYZE
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Optimization: Add index on bookings.user_id
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);


-- Query 2: Get bookings with user and property data for last 30 days
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    u.email,
    p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '30 days';

-- Optimization: Composite index for frequent filter + join
CREATE INDEX IF NOT EXISTS idx_bookings_start_user ON bookings(start_date, user_id);
