--Create list of retirement titles
SELECT e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Use Dictinct with Orderby to remove duplicate rows


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO distinct_titles
FROM retirement_titles
WHERE (to_date='9999-01-01')
ORDER BY emp_no, emp_no DESC;



--retrieve the number of employees by their most recent job title who are about to retire


SELECT
	title,
	COUNT (emp_no)
INTO retiring_titles
FROM distinct_titles
GROUP BY
	title
ORDER BY
	count desc;

    --Deliverable 2 determine which employees are eligible for mentorship program
 SELECT DISTINCT ON (e.emp_no)e.emp_no, e.first_name, e.last_name,e.birth_date,
		 d.from_date, d.to_date,
		 t.title
INTO mentorhip_eligibility
FROM employees as e
INNER JOIN dept_employees as d
ON (e.emp_no=d.emp_no)
INNER JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date='9999-01-01')
ORDER BY e.emp_no;
