-- Retrieves full booking info with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;



-- Refactored version with selected columns and indexing in mind
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.email,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id
ORDER BY b.created_at DESC;
