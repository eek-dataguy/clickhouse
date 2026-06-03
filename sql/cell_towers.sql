CREATE DATABASE sample_dataset;

DROP TABLE IF EXISTS sample_dataset.cell_towers;

CREATE TABLE sample_dataset.cell_towers (
    radio Enum8('' = 0, 'CDMA' = 1, 'GSM' = 2, 'LTE' = 3, 'NR' = 4, 'UMTS' = 5),
    mcc UInt16,
    net UInt16,
    area UInt16,
    cell UInt64,
    unit Int16,
    lon Float64,
    lat Float64,
    range UInt32,
    samples UInt32,
    changeable UInt8,
    created DateTime,
    updated DateTime,
    averageSignal UInt8
)
ENGINE = MergeTree()
ORDER BY (radio, mcc, net, created);


INSERT INTO sample_dataset.cell_towers
FORMAT CSVWITHNAMES < '/var/lib/clickhouse/cell_towers.csv';

SELECT * FROM sample_dataset.cell_towers LIMIT 10;

SELECT COUNT(*) AS CNT_ROWS FROM sample_dataset.cell_towers;

SELECT radio, COUNT(*) AS CNT_ROWS
FROM sample_dataset.cell_towers
GROUP BY radio
ORDER BY CNT_ROWS DESC;

SELECT * FROM sample_dataset.cell_towers
WHERE radio = 'LTE'
LIMIT 10;

