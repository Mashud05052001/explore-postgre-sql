-- Creating a table
CREATE TABLE students (
    student_id SERIAL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(50),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50),
    PRIMARY KEY(student_id)
);

-- Inserting data into the students table
INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) 
    VALUES 
        ('John', 'Doe', 20, 'A', 'Computer Science', 'john.doe@example.com', '2004-02-14', 'O+', 'USA'),
        ('Jane', 'Smith', 19, 'B', 'Mathematics', 'jane.smith@example.com', '2005-05-22', 'A-', 'USA'),
        ('Emily', 'Johnson', 21, 'A', 'Physics', 'emily.johnson@example.com', '2003-08-10', 'B+', 'UK'),
        ('Michael', 'Williams', 22, 'B', 'Chemistry', 'michael.williams@example.com', '2002-03-18', 'AB-', 'USA'),
        ('Sarah', 'Brown', 20, 'C', 'Biology', 'sarah.brown@example.com', '2004-09-25', 'O-', 'USA'),
        ('David', 'Jones', 23, 'A', 'Economics', 'david.jones@example.com', '2001-11-30', 'A+', 'UK'),
        ('Linda', 'Garcia', 18, 'B', 'History', 'linda.garcia@example.com', '2006-06-17', 'B-', 'UK'),
        ('James', 'Miller', 21, 'C', 'Political Science', 'james.miller@example.com', '2003-01-12', 'O+', 'UK'),
        ('Karen', 'Martinez', 19, 'A', 'Engineering', 'karen.martinez@example.com', '2005-12-05', 'AB+', 'UK'),
        ('Robert', 'Davis', 22, 'B', 'Law', 'robert.davis@example.com', '2002-07-14', 'A-', 'USA'),
        ('Sophia', 'Lopez', 20, 'A', 'Sociology', 'sophia.lopez@example.com', '2004-04-09', 'O+', 'Argentina'),
        ('Daniel', 'Gonzalez', 21, 'B', 'Philosophy', 'daniel.gonzalez@example.com', '2003-08-29', 'AB-', 'Brazil'),
        ('Olivia', 'Wilson', 18, 'C', 'Art', 'olivia.wilson@example.com', '2006-09-11', 'B+', 'France'),
        ('Matthew', 'Moore', 19, 'A', 'Business', 'matthew.moore@example.com', '2005-10-03', 'A+', 'Germany'),
        ('Ava', 'Taylor', 23, 'B', 'Nursing', 'ava.taylor@example.com', '2001-02-27', 'O-', 'USA'),
        ('Jacob', 'Anderson', 21, 'A', 'Journalism', 'jacob.anderson@example.com', '2003-12-20', 'B-', 'Italy'),
        ('Mia', 'Thomas', 19, 'C', 'Design', 'mia.thomas@example.com', '2005-03-14', 'A-', 'Netherlands'),
        ('William', 'Harris', 22, 'B', 'Marketing', 'william.harris@example.com', '2002-05-25', 'O+', 'Australia'),
        ('Isabella', 'Clark', 20, 'A', 'Psychology', 'isabella.clark@example.com', '2004-07-07', 'B+', 'New Zealand'),
        ('Elijah', 'Lewis', 21, 'C', 'Architecture', 'elijah.lewis@example.com', '2003-11-02', 'A+', 'South Africa');

/*
Postgres column bujale double quotation ""
& string bujale single quotation ''
not  =>  <>  !=  NOT . EX: 1. country != 'USA'   2. country <> 'USA'    3. NOT country = 'USA'
Select: 
    1. Get custom define fields.
    2. Get custom define fields with alternate column name
    3. Select fields & sort single or multiple according values
    4. Select only unique values from the database. DISTINCT
    5. Using WHERE keyword we can search condition wise. 
Operators
    1. AND, OR, NOT
    2. IN, NOT IN
    3. BETWEEN    Ex:  BETWEEN 21 AND 22
    4. LIKE (Case Sensitive) ( % _ ), ILIKE (Case Insensitive)    Ex:  LIKE '_a%'
*/


SELECT * FROM students;
SELECT email as "Student Email",age, blood_group, first_name FROM students; 
SELECT age, last_name FROM students ORDER BY age DESC, last_name ASC;
SELECT DISTINCT country from students ORDER BY country ASC;

SELECT * from students
    -- WHERE country = 'USA';
    -- WHERE grade = 'A' AND course = 'Physics';
    -- WHERE blood_group = 'A+';
    -- where country = 'USA' OR country = 'Australia'
    -- WHERE (country = 'USA' OR country = 'Australia') AND age > 20
    -- WHERE (grade = 'A' or grade = 'B') AND (course = 'Physics' or course = 'Mathematics')
    -- WHERE age<>20 ORDER BY age DESC;
    -- WHERE country NOT IN('USA', 'UK', 'Canada');
    -- WHERE age BETWEEN 21 AND 22 ORDER BY age;
    -- WHERE dob BETWEEN '2001-01-01' AND '2005-01-01' ORDER BY dob;
    -- WHERE first_name LIKE '_a%'; 
        /*
            1. _ means skip this position
            2. % means any valut & any number of value
            3. [asd] means it can be a or s or d in this same position or index. Not work in postgreSQL. Use instead of regex 
        */
    WHERE first_name ILIKE 'D%';


/*
Function => Scalar & Aggregate Function
Scalar Function  ->  It operate on a single value & return a single value. They perform an operation on each row's data independently.
                     upper() lower() concat() length()
Aggregate ""  ->  It operate on a set of values & return a single value summarizing the set. Thwy perform an operation across 
                  multiple rows, often used the GROUP BY clause.
                  avg() max() min() sum() count()
                  
*/

SELECT upper(first_name) as "FIRST NAME", * FROM students;
SELECT concat(upper(first_name), ' ', upper(last_name)), * from students;
SELECT length(first_name) as first_name_length, first_name FROM students;

SELECT 
    avg(age) as "Average Age", 
    max(age) as "Maximum Age", 
    min(age) as "Minimum Age", 
    sum(age) as "Total Age", 
    count(*) as "Count"
from students;
SELECT max(length(first_name)) FROM students;



/* NULL
1. If we works with NULL then should use is operator instead of = != ..... Ex. WHERE age is NOT NULL
2. COALESCE => used in to provide another value instead of NULL at data retrival time
   Ex. SELECT COALESCE(email, 'Email Not Provided') as "Email" from students;
       COALESCE datatype er same type information next e dite hobe. like email deway wita VARCHAR so string diyechi
*/
SELECT * from students
    WHERE email is NULL;

SELECT COALESCE(email, 'Email Not Provided') as "Email" from students;


/* Pagination
1. LIMIT 
2. OFFSET === skip. OFFSET 5 means it skips data from top 5
*/

SELECT * FROM students LIMIT 5 OFFSET (5 * 1);

SELECT * FROM students ORDER BY (student_id);


/*
Delete, Update, Drop time e must be filtering kore delete korbo nahole sobkichu eksathe chole jabe
*/
-- DELETE OPERATION
DELETE from students WHERE country = 'USA';

-- UPDATE OPERATION
UPDATE students 
    SET email = 'default@gmail.com', age=20
    WHERE student_id = 23; 