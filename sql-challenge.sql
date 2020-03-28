CREATE TABLE "departments" (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);


CREATE TABLE "dept_emp" (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE "dept_manager" (
    dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "employees" (
    emp_no SERIAL PRIMARY KEY,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE "salaries" (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "titles" (
    emp_no INT NOT NULL,
    titles VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

------------------------------------------------------
1.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary 
FROM employees
INNER JOIN salaries
ON employees.emp_no=salaries.emp_no;

------------------------------------------------------
2. 
SELECT * FROM employees;
SELECT first_name, last_name 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31' ;


------------------------------------------------------
-- List the manager of each department with department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates
3. 
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM departments;

SELECT employees.emp_no, 
employees.first_name, 
employees.last_name, 
dept_manager.dept_no, 
dept_manager.from_date, 
dept_manager.to_date,
departments.dept_name

FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no

ORDER BY dept_manager.dept_no;

------------------------------------------------------
4.

