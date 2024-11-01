-- EXIST mainly returns a true / false
SELECT * FROM departments as a
WHERE EXISTS (
    SELECT * FROM departments as d WHERE a.dept_id=101 or a.dept_id=102
)