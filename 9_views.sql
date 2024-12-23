/*
    Views are virtual tables generated from the result of a SQL query
    Purpose :   Simplify complex queries, Improved security, Enhanced data abstraction
*/


CREATE View dept_avg_salary AS
    SELECT department_name, ROUND(avg(salary),2) FROM employees GROUP BY department_name;

SELECT * from dept_avg_salary;

-- This view are NON materialized view. In non materialized view when we call it it run the full function & gives the value. But if we used material view then for first time only it run & saved the data in storage. After then whenever we call it it returns the stored data. AS a result we cannot get the updated data if it update after that but we get the data faster then non materialized view. It boost up the speed.
<<<<<<< HEAD
=======

CREATE VIEW mahi AS
    SELECT * FROM employees;
>>>>>>> 8c9dd0e49de598bba5fe47b7fa5c26200204de50
