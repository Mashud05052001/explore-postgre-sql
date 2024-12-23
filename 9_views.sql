/*
    Views are virtual tables generated from the result of a SQL query
    Purpose :   Simplify complex queries, Improved security, Enhanced data abstraction
*/


CREATE View dept_avg_salary AS
    SELECT department_name, ROUND(avg(salary),2) FROM employees GROUP BY department_name;

SELECT * from dept_avg_salary;


CREATE VIEW mahi AS
    SELECT * FROM employees;
