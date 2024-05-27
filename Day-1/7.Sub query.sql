1) PostgreSQL subquery with IN operator

SELECT * from ordered
where customer_id IN (select customer_id from customer where active = true)

2) PostgreSQL subquery with EXISTS operator

SELECT
    customer_id,
	first_name,
	last_name,
	email
FROM
	information
WHERE
	EXISTS (
		SELECT
			1
		FROM
			ordered
		WHERE
			ordered.customer_id = information.customer_id
	);