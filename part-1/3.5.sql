-- 3.5. Window Functions

SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

SELECT depname, empno, salary,
    rank() OVER (PARTITION BY depname ORDER BY salary DESC)
FROM empsalary;


-- Window frame
-- sum function operates on window frame rather than partition
-- If we omit ORDER BY in OVER, then window frame is equal to partition. If we omit PARTITION BY, then window frame is equal to whole table 
SELECT salary, sum(salary) OVER () FROM empsalary;

-- If we add ORDER BY, then window frame will change and output won't be the same 
SELECT salary, sum(salary) OVER (ORDER BY salary) FROM empsalary;

-- In order to filter or group rows after the window calculations are performed, we can use a sub-select
SELECT depname, empno, salary, enroll_date
FROM
    (SELECT depname, empno, salary, enroll_date
        rank() OVER (PARTITION BY depname ORDER BY salary DESC, empno) AS pos
        FROM empsalary
    ) AS ss
WHERE pos < 3;

-- Multiple window function calls
SELECT sum(salary) OVER w, avg(salary) OVER w
    FROM empsalary
    WINDOW w AS (PARTITION BY depname ORDER BY salary DESC);