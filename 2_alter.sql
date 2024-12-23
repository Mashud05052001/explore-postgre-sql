-- Active: 1729194579963@@127.0.0.1@5432@ph
SELECT * FROM person2;

ALTER TABLE person2
-- Renaming a table --
    -- RENAME TO person;
-- Add Column --
    -- ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;
    -- ADD COLUMN email VARCHAR(25) UNIQUE;
-- Delete Column --
    -- DROP COLUMN email;
-- Change type of a column --
    -- ALTER COLUMN user_name TYPE VARCHAR(25)
-- Add constraint of a column. Unique, Primary Key, Foreign Key kaj korbe na ei system e.--
    -- ALTER COLUMN user_age set NOT NULL;
-- Remove existing constraint from a column --
    -- ALTER COLUMN user_age DROP NOT NULL; 
-- Rename a column --
    -- RENAME COLUMN age TO user_age;


ALTER TABLE person2 
    -- ADD constraint unique_person2_user_age UNIQUE(user_age);
    -- DROP constraint unique_person2_user_age;
    -- ADD constraint pk_person2_id PRIMARY KEY(id);