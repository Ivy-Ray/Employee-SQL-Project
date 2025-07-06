💼 Employee Management System — SQL Project

Welcome to the **Employee Management System**, a beginner-friendly SQL portfolio project that simulates a real-world corporate HR database. This project demonstrates core database concepts such as table creation, data relationships, joins, and data analysis with SQL queries.

---

📘 Project Overview

This project models a typical company's HR structure, storing data about employees, departments, and performance reviews. It's designed to help students and beginners practice:

- Relational database design
- SQL table creation with constraints
- Data insertion and query execution
- Performing analytics using SQL (joins, aggregations, filters)

---

 🗂️ Database Structure

🔹 Departments Table
Stores department-wise details.
- `dept_id` – Primary Key
- `dept_name` – Name of the department
- `location` – Office location

🔹 Employees Table
Stores employee information.
- `emp_id` – Primary Key
- `name`, `gender`, `join_date`, `job_role`
- `package_lpa` – Annual salary in LPA
- `degree`, `experience_years`
- `dept_id` – Foreign Key referencing `Departments`

🔹 Performance Table
Stores performance scores of employees.
- `review_id` – Primary Key
- `emp_id` – Foreign Key referencing `Employees`
- `review_date`, `score`

---

## 🧠 Sample SQL Queries

```sql
-- 1. List employees with department and location
SELECT e.name, e.job_role, d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 2. Average salary per department
SELECT d.dept_name, AVG(e.package_lpa) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 3. Top 3 performers
SELECT e.name, p.score
FROM Employees e
JOIN Performance p ON e.emp_id = p.emp_id
ORDER BY p.score DESC
LIMIT 3;
