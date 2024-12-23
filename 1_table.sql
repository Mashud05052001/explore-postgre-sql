-- create DATABASE ph;

-- Creating Table
-- create TABLE person (
--     person SERIAL,
--     first_name VARCHAR(20),
--     last_name VARCHAR(20),
--     age INTEGER,
--     is_active BOOLEAN,
--     dob DATE
-- )

--  Renaming a table
-- ALTER TABLE person RENAME TO "user";

-- Delete a table
-- DROP table "user";

-- Creating table with constrant
-- create TABLE person1(
--     id SERIAL PRIMARY KEY,
--     user_name VARCHAR(20) NOT NULL,
--     age INTEGER CHECK (age>=18)
-- )

create TABLE person2(
    id SERIAL,
    user_name VARCHAR(20) NOT NULL,
    user_age INTEGER CHECK (user_age>=18),
    email VARCHAR(25) UNIQUE,
    PRIMARY KEY(id)
);

-- create TABLE person3(
--     id SERIAL,
--     user_name VARCHAR(20) NOT NULL,
--     age INTEGER CHECK (age>=18),
--     PRIMARY KEY(id, user_name),
--     UNIQUE(user_name)
-- );

INSERT  INTO person2 (id, user_name, user_age, email) 
    VALUES (1, 'Mashud' , 20, '1@gmail.com') ,
     (2, 'Rahman' , 21, '2@gmail.com'),
     (3, 'Mahi' , 22, '3@gmail.com');

SELECT * FROM person2;


-- Remains table but clear all the table data
TRUNCATE TABLE person2;


DROP TABLE person2;























