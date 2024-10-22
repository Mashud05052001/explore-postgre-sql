/*
    A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of
    actions in response to certain database events or conditions.

    Table-Level Events:  INSERT, UPDATE, DELETE, TRUNCATE

    Database-Level Events:   Database Startup, Database Shutdown, Connection start and end etc

    CREATE TRIGGER trigger_name
        {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
        ON table_name
        [FOR EACH ROW]
        EXECUTE FUNCTION function_name();
*/

CREATE TABLE my_users (name VARCHAR(30) , email VARCHAR(30));
INSERT INTO my_users (name, email) VALUES('Roman', 'roman@gmail.com'),('random','random@gmail.com');

CREATE TABLE deleted_user_log (deleted_user_name VARCHAR(30) , deletedAt TIMESTAMP);



CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN 
        INSERT INTO deleted_user_log VALUES(OLD.name , now());
        RAISE NOTICE 'Deleted user audit log created';
        RETURN OLD;
    END
$$;



CREATE TRIGGER save_deleted_user_trigger 
    BEFORE DELETE
    ON my_users
    FOR EACH ROW
    EXECUTE FUNCTION save_deleted_user();

SELECT * from deleted_user_log;
SELECT * from my_users;

DELETE FROM my_users WHERE name = 'Roman';
