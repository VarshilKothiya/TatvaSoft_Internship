1) PostgreSQL INNER JOIN

SELECT * FROM ordered as o
INNER JOIN information as c
ON o.customer_id = c.customer_id

2) PostgreSQL LEFT JOIN

select * FROM information as c
LEFT JOIN ordered as o
ON c.customer_id = o.customer_id


