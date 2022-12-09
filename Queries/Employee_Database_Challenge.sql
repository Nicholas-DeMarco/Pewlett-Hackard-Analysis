SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retiring_title
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01'
	   AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retiring_title as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

--Create a table to count the # of retirees by title

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles_count
FROM unique_titles as ut
GROUP BY title
ORDER BY count DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01'
	  AND '1965-12-31')
	  AND (ti.to_date = '9999-01-01')
ORDER BY emp_no;