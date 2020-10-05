-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE MATERIALIZED VIEW employee_info AS 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.salary;

REFRESH MATERIALIZED VIEW employee_info;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE MATERIALIZED VIEW employees_1986 AS 
SELECT first_name, last_name, hire_date -- EXTRACT(YEAR FROM hire_date)
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

REFRESH MATERIALIZED VIEW employees_1986;

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.
-- option 1
CREATE MATERIALIZED VIEW manager_each_department AS 
SELECT d.dept_no, d.dept_name, de.emp_no, e.emp_title_id, ti.title, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
INNER JOIN employees e
	ON e.emp_no = de.emp_no
INNER JOIN titles ti
	ON ti.title_id = e.emp_title_id
WHERE title = 'Manager';

REFRESH MATERIALIZED VIEW manager_each_department;

-- Option 2
-- SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, ti.title
-- FROM departments d 
-- INNER JOIN dept_emp de
-- 		ON d.dept_no = de.dept_no
-- INNER JOIN dept_manager dm
-- 		ON de.emp_no = dm.emp_no
-- INNER JOIN employees e
-- 		ON dm.emp_no = e.emp_no
-- -- Check to make sure their titles are 'Manager'.
-- INNER JOIN titles ti
-- 		ON e.emp_title_id = ti.title_id;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.
CREATE MATERIALIZED VIEW department_of_each_employee AS
SELECT d.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
INNER JOIN employees e
	ON e.emp_no = de.emp_no;

REFRESH MATERIALIZED VIEW department_of_each_employee;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE MATERIALIZED VIEW employees_Hercules_B_name AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

REFRESH MATERIALIZED VIEW employees_Hercules_B_name;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE MATERIALIZED VIEW employees_in_Sales AS
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
INNER JOIN employees e
	ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales';

REFRESH MATERIALIZED VIEW employees_in_Sales;

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.
CREATE MATERIALIZED VIEW employees_in_Sales_Development AS
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
INNER JOIN dept_emp de
	ON d.dept_no = de.dept_no
INNER JOIN employees e
	ON e.emp_no = de.emp_no
WHERE dept_name IN ('Development', 'Sales');

REFRESH MATERIALIZED VIEW employees_in_Sales_Development;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE MATERIALIZED VIEW shared_last_name AS
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name 
ORDER BY last_name DESC;

REFRESH MATERIALIZED VIEW shared_last_name;