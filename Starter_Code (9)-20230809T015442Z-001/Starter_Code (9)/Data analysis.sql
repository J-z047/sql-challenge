-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no AS "Employee Number", 
       e.last_name AS "Last Name",
       e.first_name AS "First Name",
       e.sex AS "Sex",
       s.salary AS "Salary"
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name AS "First Name",
       last_name AS "Last Name",
       hire_date AS "Hire Date"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, 
-- last name, and first name
SELECT dm.emp_no AS "Employee Number",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       dm.dept_no AS "Department Number",
       d.dept_name AS "Department Name"
FROM depart_manager dm
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no AS "Employee Number",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       d.dept_name AS "Department Name"
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name
SELECT e.emp_no AS "Employee Number",
       e.first_name AS "First Name",
       e.last_name AS "Last Name",
       d.dept_name AS "Department Name"
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)
SELECT last_name AS "Last Name",
       COUNT(last_name) AS "Count",
       RANK() OVER (ORDER BY COUNT(last_name) DESC) AS "Rank"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;
