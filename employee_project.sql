create database CORPORATE;

-- Department Table
CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

USE CORPORATE;
-- Employees Table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    gender CHAR(1),
    join_date DATE,
    dept_id INT,
    job_role VARCHAR(50),
    package_lpa DECIMAL(5,2), -- e.g., 6.50 LPA
    degree VARCHAR(50),
    experience_years INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Performance Table
CREATE TABLE Performance (
    review_id INT PRIMARY KEY,
    emp_id INT,
    review_date DATE,
    score INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Departments
INSERT INTO Departments VALUES
(1, 'HR', 'Mumbai'),
(2, 'Sales', 'Delhi'),
(3, 'Engineering', 'Bangalore'),
(4, 'Finance', 'Kolkata');

-- Employees
INSERT INTO Employees VALUES
(101, 'Amit Sharma', 'M', '2021-06-15', 3, 'Software Engineer', 7.50, 'B.Tech', 3),
(102, 'Priya Das', 'F', '2022-01-10', 2, 'Sales Executive', 5.20, 'MBA', 2),
(103, 'Rahul Mehra', 'M', '2020-09-05', 4, 'Finance Analyst', 6.80, 'B.Com', 4),
(104, 'Sneha Roy', 'F', '2023-03-12', 1, 'HR Manager', 6.00, 'MBA', 1),
(105, 'Karan Patel', 'M', '2019-11-20', 3, 'Data Scientist', 9.00, 'M.Tech', 5);

-- Performance
INSERT INTO Performance VALUES
(1, 101, '2024-06-01', 88),
(2, 102, '2024-06-01', 76),
(3, 103, '2024-06-01', 68),
(4, 104, '2024-06-01', 90),
(5, 105, '2024-06-01', 95);

SELECT * FROM Departments; 
SELECT * FROM Employees; 
SELECT * FROM Performance; 

SELECT e.emp_id, e.name, e.job_role, e.package_lpa, e.degree, e.experience_years,
       d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

SELECT d.dept_name, AVG(e.package_lpa) AS avg_package
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT e.name, e.job_role, p.score
FROM Employees e
JOIN Performance p ON e.emp_id = p.emp_id
WHERE p.score > 80;

SELECT d.dept_name, e.name, MAX(e.package_lpa) AS highest_package
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT degree, COUNT(*) AS total_employees
FROM Employees
GROUP BY degree;
