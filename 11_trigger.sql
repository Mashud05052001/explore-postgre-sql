/*
    A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of
    actions in response to certain database events or conditions.

    Table-Level Events:
        -- INSERT, UPDATE, DELETE, TRUNCATE

    Database-Level Events:
        -- Database Startup, Database Shutdown, Connection start and end etc

    CREATE TRIGGER trigger_name
        {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
        ON table_name
        [FOR EACH ROW]
        EXECUTE FUNCTION function_name();
*/