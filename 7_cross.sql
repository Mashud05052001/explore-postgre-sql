CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments(
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES(1,'C', 103), (2,'D', 105);
INSERT INTO departments VALUES(103,'Dept C'), (104,'Dept D');

SELECT * FROM employees;
SELECT * FROM departments;
/*
-- CROSS JOIN => Number of rows = 1st Table rows * 2nd Table rows. 
    Process: 1st table er 1st column 2nd table er sob column ke multiply kore add korbe data. Then 1st table er 2nd column again 2nd table er sob column ke multiply kore add korbe data. Eivabe kartesio gun akare hote thakbe
-- NATURAL JOIN => Both table e must a common column thakte hobe & jesob common column er value both table e matched tader return korbe.
    Process: First e Cross Join korbe. Then both table er same column only jader ta match hobe tader e return kore dibe. & Common column 2 tar maje 1 ta return korbe
    *** Jodi common column na thake tahole CROSS JOIN er moton kaj korte pare or error dite pare. Depends on RDMS which you followed
*/
SELECT * FROM employees
    -- CROSS JOIN departments;
    NATURAL JOIN departments;