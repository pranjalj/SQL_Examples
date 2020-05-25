WITH RECURSIVE query1 as
(SELECT DISTINCT t1.title as src, t2.title as dst, AVG(YEAR(t1.to_date) - YEAR(t1.from_date) + 1) as distance, 0 FROM titles as t1 INNER JOIN titles as t2 ON t1.emp_no = t2.emp_no WHERE t1.title != t2.title and t1.to_date = t2.from_date GROUP BY src,dst),
cte_query(src,dst,distance,depth) as
(SELECT * FROM query1 UNION SELECT cq.src, q.dst, (q.distance + cq.distance) as distance, (cq.depth + 1) FROM query1 as q INNER JOIN cte_query as cq ON q.src = cq.dst AND cq.depth < 5)
SELECT cq.src as src, cq.dst as dst, MIN(cq.distance) as years FROM cte_query as cq WHERE cq.src != cq.dst GROUP BY src,dst ORDER BY src,dst;  
