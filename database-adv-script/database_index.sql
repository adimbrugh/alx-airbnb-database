-- ✅ Indexes for Users table
-- Often used in JOINs and WHERE clauses
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_user_id ON users(user_id);

-- ✅ Indexes for Bookings table
-- Frequently used in JOINs and filters
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- ✅ Indexes for Properties table
-- Used in JOINs, WHERE, and ORDER BY
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_created_at ON properties(created_at);

-- ✅ Indexes for Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- ✅ Indexes for Payments table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
