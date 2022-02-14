-- Creating tables for PH-EmployeeDB
CREATE TABLE departments(
dept_number VARCHAR(4)NOT NULL,
dept_name VARCHAR(40)NOT NULL,
PRIMARY KEY (dept_number),
UNIQUE (dept_name)
);

--Creating tables for employees
CREATE TABLE employees(
emp_no INT NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
gender VARCHAR NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no));

--Creating table for department managers
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_number),
    PRIMARY KEY (emp_no, dept_no)
);

--Create table for salaries
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
--Create table for department employees
	
CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY(emp_no)REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no)REFERENCES departments(dept_number));

	
--Create table for titles

CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no));
