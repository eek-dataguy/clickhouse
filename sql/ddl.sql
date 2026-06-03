CREATE DATABASE sql_examples;

# create a table with log engine
CREATE TABLE sql_examples.logs (
    id UInt64,
    timestamp DateTime,
    level Enum8('DEBUG' = 1, 'INFO' = 2, 'WARN' = 3, 'ERROR' = 4),
    message String
)
ENGINE = Log();

# insert some sample log data
INSERT INTO sql_examples.logs (id, timestamp, level, message) VALUES
(1, '2024-01-01 12:00:00', 'INFO', 'Application started'),
(2, '2024-01-01 12:01:00', 'DEBUG', 'Debugging application'),
(3, '2024-01-01 12:02:00', 'WARN', 'Low disk space'),
(4, '2024-01-01 12:03:00', 'ERROR', 'Application crashed'); 

SELECT * FROM sql_examples.logs;