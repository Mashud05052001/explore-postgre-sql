/*
A database index is a strategically designed data structure that enhances the speed of data retrieval activities in a database table.
Primary Key te database autometically indexing add kore dey. 
Foreign key te must try korbo indexing use korar
Cost : 
    1. Indexing takes more space.

Which field of data meed indexing
    1. Must Foreign key field needs indexing for get quick retrival data
    2. Thos fields which are not friquently changed because of data insert, delete, update time e index o change hoy tai time beshi lage

CREATE INDEX index_name
    ON table_name (table_column_name);

Indexing Type :  B-TREE (Default), HASH, GIN, GIST

Particular onno kunu iondexing set korte chaile
CREATE INDEX index_name
    ON table_name USING INDEX_TYPE (table_column_name);

*/

CREATE TABLE allEmployees (
    emp_no SERIAL PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR(1) CHECK (gender IN ('M','F')),
    hire_date DATE
)

-- Generate 10000000 records for the allEmployees table
INSERT INTO allEmployees (birth_date, first_name, last_name, gender, hire_date)
    SELECT
        date '1950-01-01' + (random() * (date '2000-12-31' - date '1950-01-01'))::int AS birth_date,
        (ARRAY['John', 'Jane', 'Alex', 'Emily', 'Michael', 'Sarah', 'David', 'Laura', 'Chris', 'Sophia'])[
            floor(random() * 10 + 1)::int
        ] AS first_name,
        (ARRAY['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Taylor', 'Anderson'])[
            floor(random() * 10 + 1)::int
        ] AS last_name,
        (ARRAY['M', 'F'])[floor(random() * 2 + 1)::int] AS gender,
        date '2000-01-01' + (random() * (date '2023-12-31' - date '2000-01-01'))::int AS hire_date
    FROM generate_series(1, 100000); 

INSERT into allemployees (birth_date, first_name, last_name, gender, hire_date) 
    VALUES ('1974-08-11', 'Mashudur Rahman', 'Mahi', 'M', '2020-08-11')


-- EXPLAIN ANALYSE
SELECT * from allEmployees ORDER BY emp_no;

EXPLAIN ANALYSE
SELECT * FROM allemployees WHERE last_name = 'Mahi';
EXPLAIN ANALYSE
SELECT * FROM allemployees WHERE first_name = 'Mashud%';



DROP INDEX idx_allEmployees_last_name;

CREATE INDEX idx_allEmployees_first_name
    ON allEmployees (first_name);


SHOW data_directory;