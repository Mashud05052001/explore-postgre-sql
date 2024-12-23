/*
TimeStamp => Date + Time + TimeZone
type => TIMESTAMP WITH TIME ZONE, TIMESTAMP
now() => get the current timestamp
CURRENT_DATE/TIME/YEAR....  now()::date/time/year....
to_char(now() , "DD/MM/YYYY")  Formatting like momentJS. For any format visit documentation
now() - INTERVAL "1/2/3.. year / month / day" => current time theke oi time bad diye previous time return korbe
age(now() , '2020-20-20') => ei 2 tar interval dibe
extract(day from '2020-20-20'::date) => ei date er day return korbe. Similarly year, month, time...
*/


CREATE TABLE timeZ (ts TIMESTAMP WITH TIME ZONE , tsz TIMESTAMP WITHOUT TIME ZONE , tszz TIMESTAMP);

DELETE FROM timeZ;
TRUNCATE timeZ;
DROP TABLE timeZ;

INSERT INTO timeZ VALUES('2020-01-01', '2020-01-01 10:45:00' , '2020-01-02');

SELECT *, current_time from timeZ;

SELECT now() as "NOW", now()::time as "TIME", now()::date as "DATE" , current_time , CURRENT_DATE , current_timestamp;
SELECT to_char(now() , 'DDD');

SELECT now() - INTERVAL '1 month';

SELECT age(now() , '2020-01-01');

SELECT age(CURRENT_DATE, dob) as "AGE", extract(day from dob::date) , * from students;
