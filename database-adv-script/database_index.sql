-- Indexes for Bookings Table
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_payment_id ON bookings(payment_id);
CREATE INDEX idx_start_date ON bookings(start_date);

-- Index for Properties Table
CREATE INDEX idx_location ON properties(location);

-- (Optional if not using WHERE on email or name)
-- CREATE INDEX idx_user_email ON users(email);
