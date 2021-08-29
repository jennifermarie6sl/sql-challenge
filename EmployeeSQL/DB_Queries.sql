--employee number, last name, first name, sex, and salary.

SELECT ee.emp_no, ee.last_name, ee.first_name, ee.sex, s.salary
FROM employees ee
JOIN salaries s
ON (ee.emp_no = s.emp_no)

--employees who were hired in 1986.

Select * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--manager of each department with the following information: department number, department name, the manager’s employee number, 
--last name, first name.
    
SELECT dm.dept_no, d.dept_name, dm.emp_no, ee.last_name, ee.first_name
FROM employees ee
JOIN dept_emp de
ON (ee.emp_no = de.emp_no)
    JOIN department d
    ON (de.dept_no = d.dept_no)
        JOIN dept_manager dm
        ON (ee.emp_no = dm.emp_no);
		
--department of each employee with the following information: employee number, last name, first name, and department name.

SELECT ee.emp_no, ee.last_name, ee.first_name, d.dept_name
FROM employees ee
JOIN dept_emp de
ON (ee.emp_no = de.emp_no)
    JOIN department d
    ON (de.dept_no = d.dept_no);
	
--first name, last name, and sex for employees whose first name is “Hercules” and last names begin with “B.”

SELECT first_name, last_name, sex
FROM employees ee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';	

--employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT ee.emp_no, ee.last_name, ee.first_name, d.dept_name
FROM employees ee
JOIN dept_emp de
ON (ee.emp_no = de.emp_no)
    JOIN department d
    ON (de.dept_no = d.dept_no)
    WHERE d.dept_name = 'Sales';
	
--all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT ee.emp_no, ee.last_name, ee.first_name, d.dept_name
FROM employees ee
JOIN dept_emp de
ON (ee.emp_no = de.emp_no)
    JOIN department d
    ON (de.dept_no = d.dept_no)
    WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';
	
--descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Last Names" DESC;