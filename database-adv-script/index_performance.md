# Database Index Optimization Report

## Index Creation Commands
```sql
-- Users Table Indexes
CREATE INDEX idx_users_email ON users(email);  -- For login queries
CREATE INDEX idx_users_role ON users(role);    -- For role-based filtering

-- Properties Table Indexes
CREATE INDEX idx_properties_host ON properties(host_id);          -- Host dashboard queries
CREATE INDEX idx_properties_location ON properties(location);     -- Location searches
CREATE INDEX idx_properties_price ON properties(price_per_night); -- Price filtering
CREATE INDEX idx_property_search ON properties(location, price_per_night); -- Composite for common searches

-- Bookings Table Indexes
CREATE INDEX idx_bookings_user ON bookings(user_id);              -- User booking history
CREATE INDEX idx_bookings_property ON bookings(property_id);      -- Property performance
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);-- Date range queries
CREATE INDEX idx_bookings_status ON bookings(status);             -- Status filtering
