Employee-SQL-Project
Corporate Employee Management Project using SQL
# Create the README.md file content again with clean formatting for GitHub
readme_content = """
# 💼 Employee Management SQL Project

📋 Project Summary
A beginner-friendly SQL project designed to simulate a corporate HR system. This project manages employee records, job roles, departments, salaries, education qualifications, and performance reviews.

---

🧱 Features
- 👨‍💼 Track employee information including roles, salaries, and experience
- 🏢 Manage departments and locations
- 📈 Performance review system for employees
- 📊 Useful queries for HR analytics and decision-making

---

🗃️ Tables Included
1. **Departments** – Department ID, name, and location
2. **Employees** – Employee details with foreign key to department
3. **Performance** – Review score for each employee

---

🛠 Technologies Used
- SQL (MySQL)
- GitHub for version control

import os

# Create the folder structure
project_folder = "/mnt/data/Employee-SQL-Project"
os.makedirs(project_folder, exist_ok=True)

# README.md content
readme_content = """
# 💼 Employee Management SQL Project

## 📋 Project Summary
A beginner-friendly SQL project designed to simulate an HR system for managing employee data in a corporate environment. It includes departments, employee roles, salaries, education background, and performance tracking.

## 🧱 Features:
- Tracks employees, departments, and performance reviews
- Supports queries like average salary, top performers, and department statistics
- Easy to understand table relationships using foreign keys

## 🛠 Tables Used:
1. **Employees**
2. **Departments**
3. **Performance**

## 📊 Sample SQL Queries:
- List all employees with department names and locations
- Show top 5 performers based on review scores
- Find the average salary for each department
- Identify freshers (experience ≤ 1 year)

## 💡 Technologies Used:
- SQL (MySQL / PostgreSQL / SQLite)
- GitHub for version control
- Optional: dbdiagram.io for ER diagram

## 📎 How to Run:
1. Import the `employee_project.sql` into your SQL environment.
2. Use queries from `sample_outputs.txt` or create your own.
3. Optional: Visualize table relationships using `ER_diagram.png`.

## 🔗 GitHub Repository
(Replace this with your repo link once uploaded)
"""

# SQL file content (schema + sample inserts + queries)
sql_content = """
-- === Department Table ===
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- === Employees Table ===
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender CHAR(1),
    join_date DATE,
    dept_id INT,
    job_role VARCHAR(50),
    package_lpa DECIMAL(5,2),
    degree VARCHAR(50),
    experience_years INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- === Performance Table ===
CREATE TABLE Performance (
    review_id INT PRIMARY KEY,
    emp_id INT,
    review_date DATE,
    score INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- === Sample Data Insertion ===
INSERT INTO Departments VALUES
(1, 'HR', 'Mumbai'),
(2, 'Sales', 'Delhi'),
(3, 'Engineering', 'Bangalore'),
(4, 'Finance', 'Kolkata');

INSERT INTO Employees VALUES
(101, 'Amit Sharma', 'M', '2021-06-15', 3, 'Software Engineer', 7.50, 'B.Tech', 3),
(102, 'Priya Das', 'F', '2022-01-10', 2, 'Sales Executive', 5.20, 'MBA', 2),
(103, 'Rahul Mehra', 'M', '2020-09-05', 4, 'Finance Analyst', 6.80, 'B.Com', 4),
(104, 'Sneha Roy', 'F', '2023-03-12', 1, 'HR Manager', 6.00, 'MBA', 1),
(105, 'Karan Patel', 'M', '2019-11-20', 3, 'Data Scientist', 9.00, 'M.Tech', 5);

INSERT INTO Performance VALUES
(1, 101, '2024-06-01', 88),
(2, 102, '2024-06-01', 76),
(3, 103, '2024-06-01', 68),
(4, 104, '2024-06-01', 90),
(5, 105, '2024-06-01', 95);
"""

# Sample outputs (query examples)
sample_output = """
-- List employees with department and location
SELECT e.name, e.job_role, d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- Average salary per department
SELECT d.dept_name, AVG(e.package_lpa) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Top 3 performers
SELECT e.name, p.score
FROM Employees e
JOIN Performance p ON e.emp_id = p.emp_id
ORDER BY p.score DESC
LIMIT 3;
"""

# Write files
with open(os.path.join(project_folder, "README.md"), "w") as f:
    f.write(readme_content.strip())

with open(os.path.join(project_folder, "employee_project.sql"), "w") as f:
    f.write(sql_content.strip())

with open(os.path.join(project_folder, "sample_outputs.txt"), "w") as f:
    f.write(sample_output.strip())

project_folder


---

