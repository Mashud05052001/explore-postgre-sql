-- column_name column_data_type REFERENCES another_table_name(another_table_PK) ON DELETE CASCADE / SET NULL / SET DEFAULT / RESTRICT

CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(30)
);

INSERT INTO "user" (username) VALUES ('Akash'), ('Batash'), ('Sagor'), ('Nodi');

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    -- user_id INTEGER NOT NULL REFERENCES "user"(id) ON DELETE CASCADE
    -- user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL
    user_id INTEGER DEFAULT 1 REFERENCES "user"(id) ON DELETE SET DEFAULT
);
INSERT INTO post (title, user_id) 
    VALUES ('My First Post', 1),  
        ('Exploring the Mountains', 2),  
        ('A Day by the Sea', 3),  
        ('River Adventures', 4),  
        ('Cooking Tips from a Chef', 1),  
        ('The Beauty of Nature', 2); 

ALTER TABLE post
    ALTER COLUMN user_id set NOT NULL;
DROP TABLE post;
DROP TABLE "user";

SELECT * from "user";
SELECT * from post;

/*  REFERENCE
    Insertion constraint on INSERT post
    1. Attempting to insert a post with a userID that doesn't exist
    2. Attempting a post with a valid userID
    3. Attempting to insert a post without specifying a userID. NOT NULL diyechi kina er upor depends kore


    Deleting time
    1. User table theke user delete korle oi user er corresponding post er user_id null kore dewa.  => ON DELETE SET NULL
    2. User table theke user delete korle oi user er corresponding post er user_id te default kissu set kore dewa.  => ON DELETE SET DEFAULT
    3. User table theke user delete korle oi user er corresponding posts sob delete kore dewa.  =>  ON DELETE CASCADE
    4. User table er user delete korte parbo na jodi oi corresponding user er kunu post create kora thake. Age post gula delete kore dewa then user delete.
       ON DELETE RESTRICT / NO ACTION (default)

    Deletion constraint on DELETE user
    1. Cascading Deletion -> ON DELETE CASCADE
    2. Setting NULL -> ON DELETE SET NULL
    3. Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default) Na bole dilei hobe
    4. Set Default Value -> ON DELETE SET DEFAULT
*/
DELETE FROM "user"
    WHERE id=2;


SELECT * FROM post ORDER BY id;
SELECT * FROM "user";

SELECT p.id, p.title , username
    FROM post as p
    JOIN "user" as u ON u.id = p.user_id  -- INNER JOIN
    ORDER BY p.id;

-- Jodi Both table er same columnName hoto like user.userId & post.userId then, --! USING(column_name) instead of on
-- Join "user" ON user.userId=post.userId  ===  JOIN "user" USING(userId)


-- INNER JOIN => Both table er common gula niye create korbe. Supposed post.user_id NULL or emon kichu jar data user table e nei tahole eita return korbe na. Similar way te jodi user.id te emon kunu user thake jar kunu post.user_id te add kora nei tahole tar information dibe na
-- FULL JOIN = First Inner join then Left & Right full table dekhabe.
-- *** LEFT & RIGHT join er ketre table order matter kore 
-- LEFT JOIN = LEFT OUTER JOIN => First inner join er condition dibe then LEFT table er sob data dibe match na thakleo
-- RIGHT JOIN = RIGHT OUTER JOIN => First inner join er condition dibe then RIGHT table er sob data dibe match na thakleo

SELECT p.id, p.title, username FROM post as p -- First Table
    -- LEFT JOIN "user" as u ON u.id = p.user_id
    -- RIGHT OUTER JOIN "user" as u ON u.id = p.user_id
    FULL JOIN "user" as u ON u.id = p.user_id
    ORDER BY p.id;

