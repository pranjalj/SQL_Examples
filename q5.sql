SELECT d.dept_name, COUNT(*) as noe from dept_emp as de INNER JOIN departments as d ON de.dept_no = d.dept_no GROUP BY dept_name ORDER BY dept_name;
