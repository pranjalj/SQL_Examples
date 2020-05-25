SELECT d.dept_name, cd.emp_no, s.salary FROM departments as d INNER JOIN current_dept_emp as cd ON d.dept_no = cd.dept_no INNER JOIN salaries as s ON cd.emp_no = s.emp_no INNER JOIN (SELECT MIN(-1*s1.salary)*-1 as salary, d1.dept_no FROM salaries as s1 ,dept_emp as d1 WHERE d1.emp_no = s1.emp_no GROUP BY d1.dept_no) as tb ON tb.dept_no = cd.dept_no WHERE s.salary = tb.salary ORDER BY d.dept_name;
