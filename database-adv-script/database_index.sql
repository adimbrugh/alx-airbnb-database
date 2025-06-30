-- ========================================
-- ⚠️ BEFORE: Measure performance (no indexes)
-- ========================================

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = '22222222-2222-2222-2222-222222222222'
ORDER BY created_at DESC;

EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'New York'
ORDER BY created_at DESC;

EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'alice@example.com';

-- ========================================
-- ✅ Create Indexes to Optimize Performance
-- ========================================

-- Indexes on Users table
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);

-- Indexes on Bookings table
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON bookings(created_at);

-- Indexes on Properties table
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON properties(host_id);
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);
CREATE INDEX IF NOT EXISTS idx_properties_created_at ON properties(created_at);

-- Index on Reviews table
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);

-- Index on Payments table
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);

-- ========================================
-- ✅ AFTER: Measure performance (with indexes)
-- ========================================

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = '22222222-2222-2222-2222-222222222222'
ORDER BY created_at DESC;

EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'New York'
ORDER BY created_at DESC;

EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'alice@example.com';
