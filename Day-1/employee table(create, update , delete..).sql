CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC
);

SELECT * FROM employees

INSERT INTO employees (name, department, salary) VALUES
('Alice', 'HR', 60000),
('Bob', 'IT', 75000),
('Charlie', 'Finance', 50000);


UPDATE employees
SET salary = 80000
WHERE name = 'Bob';


DELETE FROM employees
WHERE name = 'Charlie';


//subquery

-- Find employees with salary greater than the average salary
SELECT name, department, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);



