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
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name

SELECT employees.emp_no, 
employees.first_name, 
employees.last_name, 
departments.dept_name

FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no;

------------------------------------------------------
5.
-- List all employees whose first name is "Hercules" and last names begin with "B"

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND 
last_name LIKE 'B%';

------------------------------------------------------
6.
-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT employees.first_name, 
employees.last_name, 
departments.dept_name

FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no

WHERE dept_name = 'Sales';


------------------------------------------------------
7.
-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
employees.first_name, 
employees.last_name, 
departments.dept_name

FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no

WHERE dept_name = 'Sales' OR 
dept_name = 'Development';


------------------------------------------------------
8.
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;


-----------------------------------------------------------
-- Just jokes
SELECT *
FROM employees
WHERE emp_no = 499942;

