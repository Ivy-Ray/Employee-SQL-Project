import os

Create the folder structure
project_folder = "/mnt/data/Employee-SQL-Project"
os.makedirs(project_folder, exist_ok=True)

README.md content
readme_content = """
💼 Employee Management SQL Project

📋 Project Summary
A beginner-friendly SQL project designed to simulate an HR system for managing employee data in a corporate environment. It includes departments, employee roles, salaries, education background, and performance tracking.

🧱 Features:
- Tracks employees, departments, and performance reviews
- Supports queries like average salary, top performers, and department statistics
- Easy to understand table relationships using foreign keys

🛠 Tables Used:
1. **Employees**
2. **Departments**
3. **Performance**

📊 Sample SQL Queries:
- List all employees with department names and locations
- Show top 5 performers based on review scores
- Find the average salary for each department
- Identify freshers (experience ≤ 1 year)

💡 Technologies Used:
- SQL (MySQL / PostgreSQL / SQLite)
- GitHub for version control

Sample outputs 
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

