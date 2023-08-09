-- Departments Table
CREATE TABLE departments (
	dept_id INT AUTO_INCREMENT PRIMARY KEY,
	dept_name VARCHAR(30) UNIQUE NOT NULL
);

-- Salaries Table
CREATE TABLE salaries (
	id INT AUTO_INCREMENT PRIMARY KEY,
	emp_no INT UNIQUE NOT NULL,
	salary FLOAT NOT NULL
);

-- Titles Table
CREATE TABLE titles (
	title_id INT AUTO_INCREMENT PRIMARY KEY,
	title_name VARCHAR(30) UNIQUE NOT NULL
);

-- Employees Personal Details Table
CREATE TABLE employee_details (
	emp_no INT AUTO_INCREMENT PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- Employees Job Details Table
CREATE TABLE employee_jobs (
	emp_no INT NOT NULL,
	title_id INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee_details(emp_no),
	FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

-- Department Employees Table
CREATE TABLE dept_emp (
	id INT AUTO_INCREMENT PRIMARY KEY,
	emp_no INT NOT NULL,
	dept_id INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee_details(emp_no),
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Department Managers Table
CREATE TABLE depart_manager (
	id INT AUTO_INCREMENT PRIMARY KEY,
	dept_id INT NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee_details(emp_no),
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
