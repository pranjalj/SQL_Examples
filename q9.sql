SELECT emp_no, (COUNT(title)) as cnt FROM titles as t WHERE from_date NOT IN (SELECT from_date FROM salaries as s WHERE s.emp_no = t.emp_no AND s.from_date = t.from_date) GROUP BY emp_no ORDER BY emp_no;
