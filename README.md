# ClickHouse

## Download the dataset

```sh
wget https://datasets.clickhouse.com/cell_towers.csv.xz
```

## Extract the data file

```sh
xz -d cell_towers.csv.xz
```

## Import the data into ClickHouse

```sh
cd /var/lib/clickhouse/
clickhouse-client --host localhost --port 9000 --user eek --password admin123 \
  --query "INSERT INTO sample_dataset.cell_towers FORMAT CSVWITHNAMES" < cell_towers.csv
```


## ClickHouse SQL

- Data Definition Language (DDL)
- Data Query Language (SQL)
- Data Manipulation Language (DML)
- Data Control Language (DCL)

### DDL — Data Definition Language

- **CREATE**
    - Create a database, table, user, or view
- **RENAME**
    - Rename a table, database, or dictionary
- **TRUNCATE**
    - Remove all records from a table
- **DROP**
    - Drop a database, table, user, view, dictionary, etc.


### DQL — Data Query Language (Queries)

- **SELECT** — retrieve data from tables.
    - Example:
        ```sql
        SELECT column_name(s) FROM table_name;
        ```
- Supports common clauses: `LIMIT`, `DISTINCT`, `WHERE`, `GROUP BY`, `ORDER BY`, etc.


### DML — Data Manipulation Language

- **INSERT** — add rows to tables.
    - Example: `INSERT INTO table_name (cols) VALUES (...)` or `FORMAT` imports.
- **MUTATIONS (ALTER)** — perform updates and deletes via `ALTER TABLE ... UPDATE/DELETE` (mutations).
- **UPDATE** — modify existing rows (implemented as mutations).
- **DELETE** — remove rows (can be lightweight or full mutations depending on engine and settings).