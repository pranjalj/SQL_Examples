WITH RECURSIVE cte_query as
(SELECT DISTINCT src, dst FROM (SELECT emp_no, title as src, from_date FROM titles) as tb1 INNER JOIN (SELECT emp_no, title as dst, from_date FROM titles) as tb2 ON tb1.emp_no = tb2.emp_no WHERE tb1.from_date < tb2.from_date UNION SELECT q.src, tb5.dst FROM (SELECT DISTINCT src, dst FROM (SELECT emp_no, title as src, from_date FROM titles) as tb3 INNER JOIN (SELECT emp_no, title as dst, from_date FROM titles) as tb4 ON tb3.emp_no = tb4.emp_no WHERE tb3.from_date < tb4.from_date) as tb5 INNER JOIN cte_query as q ON q.dst = tb5.src)
SELECT tile1.src as src, tile1.dst as dst FROM (SELECT t1.title as src, t2.title as dst FROM (SELECT DISTINCT(title) FROM titles) as t1 INNER JOIN (SELECT DISTINCT(title) FROM titles) as t2) as tile1 LEFT JOIN (SELECT * FROM cte_query) as tile2 ON tile1.src = tile2.src and tile1.dst = tile2.dst WHERE tile2.src IS NULL ORDER BY src,dst;