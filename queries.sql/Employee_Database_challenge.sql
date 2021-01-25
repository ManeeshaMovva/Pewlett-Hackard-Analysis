-- DELIVERABLE 1

-- Employees entering Retirement by Title

SELECT e.emp_no, e.first_name, e.last_name, tit.title, tit.from_date, tit.to_date
INTO retirement_titles from employees as e
JOIN titles as tit
ON e.emp_no = tit.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

SELECT * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT * from unique_titles;

-- Count of Employees entering Retirement by Title

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * from retiring_titles;

-- DELIVERABLE 2

-- Employees who are eligible to participate in Mentorship Program

SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tit.title
INTO mentorship_eligibility
FROM employees as e
	JOIN dept_emp as de
			ON e.emp_no = de.emp_no
	JOIN titles as tit
			ON e.emp_no = tit.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * from mentorship_eligibility;