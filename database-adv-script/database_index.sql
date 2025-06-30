-- ===========================================
-- ✅ 1. Measure BEFORE Indexing (Raw Performance)
-- ===========================================

-- Bookings by user (used in JOINs and filters)
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = '11111111-1111-1111-1111-111111111111'
ORDER BY created_at DESC;

-- Properties by location (used in search)
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'Dubai'
ORDER BY created_at DESC;

-- Users by email (used in login)
EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'host@example.com';

-- ===========================================
-- ⚙️ 2. Create Indexes to Optimize Queries
-- ===========================================

-- Users table
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);

-- Bookings table
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON bookings(created_at);

-- Properties table
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON properties(host_id);
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);
CREATE INDEX IF NOT EXISTS idx_properties_created_at ON properties(created_at);

-- Reviews table
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);

-- Payments table
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);

-- ===========================================
-- ✅ 3. Measure AFTER Indexing (Improved Performance)
-- ===========================================

-- Bookings by user
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = '11111111-1111-1111-1111-111111111111'
ORDER BY created_at DESC;

-- Properties by location
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'Dubai'
ORDER BY created_at DESC;

-- Users by email
EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'host@example.com';
