-- 1. Insert Users (guests, hosts, and admin)
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- Admin
(uuid_generate_v4(), 'Admin', 'System', 'admin@airbnbclone.com', '$2a$10$randomhashforadmin', '+1234567890', 'admin'),

-- Hosts
(uuid_generate_v4(), 'Sarah', 'Johnson', 'sarah@example.com', '$2a$10$hashforhost1', '+1555123456', 'host'),
(uuid_generate_v4(), 'Mike', 'Chen', 'mike@example.com', '$2a$10$hashforhost2', '+1555234567', 'host'),

-- Guests
(uuid_generate_v4(), 'Emma', 'Williams', 'emma@example.com', '$2a$10$hashforguest1', '+1555345678', 'guest'),
(uuid_generate_v4(), 'James', 'Brown', 'james@example.com', '$2a$10$hashforguest2', '+1555456789', 'guest'),
(uuid_generate_v4(), 'Olivia', 'Davis', 'olivia@example.com', '$2a$10$hashforguest3', '+1555567890', 'guest');

-- 2. Insert Properties (belonging to hosts)
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
-- Sarah's properties
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'sarah@example.com'), 
'Cozy Mountain Cabin', 'Beautiful log cabin with mountain views', 'Aspen, CO', 175.00),

(uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'sarah@example.com'), 
'Downtown Loft', 'Modern loft in city center', 'Denver, CO', 225.00),

-- Mike's properties
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'mike@example.com'), 
'Beachfront Villa', 'Luxury villa steps from the beach', 'Miami, FL', 350.00),

(uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'mike@example.com'), 
'Urban Studio', 'Compact studio perfect for solo travelers', 'New York, NY', 125.00);

-- 3. Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
-- Emma's bookings
(uuid_generate_v4(), 
 (SELECT property_id FROM properties WHERE name = 'Cozy Mountain Cabin'),
 (SELECT user_id FROM users WHERE email = 'emma@example.com'),
 '2023-12-15', '2023-12-20', 
 (SELECT price_per_night * 5 FROM properties WHERE name = 'Cozy Mountain Cabin'),
 'confirmed'),

(uuid_generate_v4(), 
 (SELECT property_id FROM properties WHERE name = 'Urban Studio'),
 (SELECT user_id FROM users WHERE email = 'emma@example.com'),
 '2024-01-10', '2024-01-15', 
 (SELECT price_per_night * 5 FROM properties WHERE name = 'Urban Studio'),
 'pending'),

-- James' booking
(uuid_generate_v4(), 
 (SELECT property_id FROM properties WHERE name = 'Beachfront Villa'),
 (SELECT user_id FROM users WHERE email = 'james@example.com'),
 '2023-11-20', '2023-11-27', 
 (SELECT price_per_night * 7 FROM properties WHERE name = 'Beachfront Villa'),
 'confirmed');

-- 4. Insert Payments for confirmed bookings
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
(uuid_generate_v4(), 
 (SELECT booking_id FROM bookings 
  WHERE property_id = (SELECT property_id FROM properties WHERE name = 'Cozy Mountain Cabin')
  AND user_id = (SELECT user_id FROM users WHERE email = 'emma@example.com')),
 875.00, 'credit_card'),

(uuid_generate_v4(), 
 (SELECT booking_id FROM bookings 
  WHERE property_id = (SELECT property_id FROM properties WHERE name = 'Beachfront Villa')
  AND user_id = (SELECT user_id FROM users WHERE email = 'james@example.com')),
 2450.00, 'stripe');

-- 5. Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
-- Emma's review
(uuid_generate_v4(),
 (SELECT property_id FROM properties WHERE name = 'Cozy Mountain Cabin'),
 (SELECT user_id FROM users WHERE email = 'emma@example.com'),
 5, 'Absolutely stunning views and cozy atmosphere!'),

-- James' review
(uuid_generate_v4(),
 (SELECT property_id FROM properties WHERE name = 'Beachfront Villa'),
 (SELECT user_id FROM users WHERE email = 'james@example.com'),
 4, 'Great location, but the wifi was spotty');

-- 6. Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
-- Guest to Host
(uuid_generate_v4(),
 (
