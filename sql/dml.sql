-- DML Operations on Cell Towers Table
-- Demonstrates INSERT, ALTER TABLE UPDATE, ALTER TABLE DELETE, and SELECT operations

-- Create the cell_towers table
CREATE TABLE IF NOT EXISTS cell_towers (
    id UInt32,
    tower_name String,
    city String,
    latitude Float64,
    longitude Float64,
    height UInt16,
    operator_name String,
    coverage_area UInt32,
    active UInt8,
    installed_date Date
) ENGINE = MergeTree()
ORDER BY (id, city);

-- INSERT: Add single record
INSERT INTO cell_towers 
VALUES (1, 'Tower-Downtown-01', 'New York', 40.7128, -74.0060, 150, 'Verizon', 5000, 1, '2020-01-15');

-- INSERT: Add multiple records
INSERT INTO cell_towers VALUES
    (2, 'Tower-Downtown-02', 'New York', 40.7150, -74.0100, 160, 'AT&T', 4800, 1, '2020-02-20'),
    (3, 'Tower-Uptown-01', 'New York', 40.7800, -73.9700, 140, 'T-Mobile', 4500, 1, '2020-03-10'),
    (4, 'Tower-Harbor-01', 'Boston', 42.3601, -71.0589, 155, 'Verizon', 5200, 1, '2020-04-05'),
    (5, 'Tower-Downtown-03', 'Boston', 42.3580, -71.0600, 145, 'AT&T', 4900, 0, '2019-12-25');

-- SELECT: Retrieve all records
SELECT * FROM cell_towers;

-- SELECT: Retrieve specific columns with WHERE clause
SELECT tower_name, city, operator_name 
FROM cell_towers 
WHERE active = 1;

-- SELECT: Filter by location
SELECT tower_name, city, height, coverage_area 
FROM cell_towers 
WHERE city = 'New York' AND height > 140;

-- SELECT: Aggregation - Count towers by city
SELECT city, COUNT(*) as tower_count 
FROM cell_towers 
GROUP BY city;

-- SELECT: Aggregation - Average height by operator
SELECT operator_name, AVG(height) as avg_height 
FROM cell_towers 
GROUP BY operator_name;

-- SELECT: Order results
SELECT tower_name, city, coverage_area 
FROM cell_towers 
ORDER BY coverage_area DESC 
LIMIT 3;

-- UPDATE: Modify a specific record (activate tower)
ALTER TABLE cell_towers UPDATE active = 1 WHERE id = 5;

-- UPDATE: Change operator for multiple towers
ALTER TABLE cell_towers UPDATE operator_name = 'Verizon' WHERE city = 'Boston' AND operator_name = 'AT&T';

-- DELETE: Remove specific records
ALTER TABLE cell_towers DELETE WHERE id = 1;

-- DELETE: Remove inactive towers
ALTER TABLE cell_towers DELETE WHERE active = 0;

-- SELECT: Verify changes after DELETE
SELECT * FROM cell_towers ORDER BY id;

-- SELECT: Complex query with JOIN (using self-join for demonstration)
SELECT 
    t1.tower_name,
    t1.city,
    t1.operator_name,
    COUNT(*) as towers_by_operator_in_city
FROM cell_towers t1
GROUP BY t1.tower_name, t1.city, t1.operator_name;

-- SELECT: Conditional expressions
SELECT 
    tower_name,
    city,
    CASE 
        WHEN height > 150 THEN 'Tall'
        WHEN height > 140 THEN 'Medium'
        ELSE 'Short'
    END as height_category
FROM cell_towers;

-- DROP TABLE (cleanup)
-- DROP TABLE cell_towers;
