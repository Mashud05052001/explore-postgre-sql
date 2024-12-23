/*
    A SubQuery is a nested query within another SQL statement. Ekta query r maje nested arekta query use kora
    SubQuery jeikhane use kortechi keyal rakhte hobe je mainquery r sathe subquery jay kina. Jodi mainquery te single kisu lage tahole subquery te emon output hote hobe jate single kisu return kore. Abar mainquery te table e compare korte chaile subqquery o oirokom hote hobe

    SubQuery can return 
        1. A single value
        2. Multiple Rows
        3. A single Column
    SubQuery Usage
        SELECT => SubQuery must return a single value
        FROM => Subquery must be return a table
        WHERE => Depents on what kind of filtering you are used
                 Like > < = != the subquery value must be single
                 If use "IN" operatorn must be provide multiple value 
*/
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
)

INSERT INTO employees (employee_name, department_name, salary, hire_date) 
    VALUES ('John Smith', 'Engineering', 75000.50, '2020-01-15'),
        ('Emma Johnson', 'Marketing', 68000.00, '2019-04-23'),
        ('Michael Brown', 'Sales', 72000.75, '2018-09-01'),
        ('Sophia Davis', 'Engineering', 82000.00, '2021-03-18'),
        ('William Wilson', 'HR', 59000.30, '2020-11-22'),
        ('Isabella Taylor', 'Finance', 91000.00, '2019-05-30'),
        ('James Anderson', 'Engineering', 78000.40, '2017-08-12'),
        ('Ava Moore', 'Sales', 63000.80, '2022-06-05'),
        ('Ethan Harris', 'Finance', 87000.20, '2020-10-15'),
        ('Mia Thompson', 'Marketing', 71000.60, '2021-01-10'),
        ('Benjamin White', 'Engineering', 95000.50, '2019-02-28'),
        ('Charlotte Martinez', 'HR', 62000.00, '2018-07-14'),
        ('Lucas Garcia', 'Sales', 76000.90, '2021-05-22'),
        ('Amelia Rodriguez', 'Finance', 84000.50, '2017-12-03'),
        ('Oliver Lee', 'Engineering', 83000.10, '2019-10-11'),
        ('Harper Walker', 'Marketing', 69000.20, '2020-02-19'),
        ('Elijah Hall', 'Finance', 94000.70, '2021-09-26'),
        ('Abigail Allen', 'HR', 60000.30, '2020-12-15'),
        ('Mason Young', 'Sales', 72000.50, '2021-03-03'),
        ('Lily Hernandez', 'Marketing', 67000.00, '2018-05-29');

SELECT max(salary) from employees WHERE department_name = 'HR'; --62000

-- Subquery with SELECT
SELECT * FROM employees 
    -- WHERE salary > (SELECT max(salary) from employees WHERE department_name = 'HR');
    WHERE department_name IN (SELECT DISTINCT(department_name) from employees WHERE department_name LIKE '%r%');



    
SELECT *, (SELECT sum(salary) from employees) as "salary" from employees;


SELECT department_name , sum(salary) FROM employees
    GROUP BY department_name;

-- Subquery With FROM
-- Do it using subquery
SELECT * FROM  -- Main Query
    (SELECT department_name , sum(salary) FROM employees GROUP BY department_name);  -- Sub Query 

