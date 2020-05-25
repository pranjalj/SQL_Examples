SELECT de.emp_no, d.dept_name, de.from_date as from_date FROM dept_emp as de INNER JOIN departments as d ON d.dept_no = de.dept_no AND YEAR(to_date) = 9999 ORDER BY de.emp_no;
