SELECT country, count(*) as "Total Students", avg(age) "Student Average Age" from students
    GROUP BY country
        HAVING count(*)>4;

-- Filter groups using having to show only countries with average age above 20.60
SELECT country, avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 20.60; 

-- Count student born in each year
SELECT extract(year from dob::date) as "Birth Year", count(*) 
    FROM students
    GROUP BY "Birth Year";

SELECT DISTINCT(extract(year from dob::date)) from students