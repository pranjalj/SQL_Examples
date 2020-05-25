SELECT e.last_name, s.salary, s.from_date, s.to_date FROM employees as e INNER JOIN salaries as s ON e.emp_no = s.emp_no ORDER BY e.last_name, s.salary, s.from_date, s.to_date;
