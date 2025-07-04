-- Step 1: Drop existing table if necessary (for testing only)
DROP TABLE IF EXISTS bookings_partitioned;

-- Step 2: Create partitioned bookings table
CREATE TABLE bookings_partitioned (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Step 3: Query to test performance (uses WHERE on partitioned column)
EXPLAIN
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
