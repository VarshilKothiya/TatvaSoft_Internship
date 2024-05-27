CREATE TABLE customer (
   customer_id serial PRIMARY KEY,
   first_name character varying(100) NOT NULL,
   last_name character varying(100) NOT NULL,
   email character varying(255) UNIQUE NOT NULL,
   created_date timestamp with time zone NOT NULL DEFAULT now(),
   updated_date timestamp with time zone
);
SELECT * FROM customer

INSERT INTO customer (first_name, last_name, email, created_date, updated_date) VALUES
  ('John', 'Doe', 'johndoe@example.com', NOW(), NULL),
  ('Alice', 'Smith', 'alicesmith@example.com', NOW(), NULL),
  ('Bob', 'Johnson', 'bjohnson@example.com', NOW(), NULL),
  ('Emma', 'Brown', 'emmabrown@example.com', NOW(), NULL),
  ('Michael', 'Lee', 'michaellee@example.com', NOW(), NULL),
  ('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), NULL),
  ('David', 'Clark', 'davidclark@example.com', NOW(), NULL),
  ('Olivia', 'Martinez', 'oliviamartinez@example.com', NOW(), NULL),
  ('James', 'Garcia', 'jamesgarcia@example.com', NOW(), NULL),
  ('Sophia', 'Lopez', 'sophialopez@example.com', NOW(), NULL),
  ('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), NULL),
  ('Jennie', 'Terry', 'jennie.terry@example.com', NOW(), NULL),
  ('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(), NULL),
  ('Hiren', 'Patel', 'hirenpatel@example.com', NOW(), NULL);

SELECT * FROM customer


UPDATE customer
SET first_name='bansi',
last_name='sachade', 
email='bansi.sachade@tatvasoft.com'
WHERE customer_id = 1;


DELETE FROM customer
WHERE customer_id = 11;



CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    order_date timestamp with time zone NOT NULL DEFAULT now(),
    order_number CHARACTER VARYING(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

SELECT * FROM orders


INSERT INTO orders (customer_id, order_date, order_number, order_amount) VALUES
  (1, '2024-01-01', 'ORD001', 50.00),
  (2, '2024-01-01', 'ORD002', 35.75),
  (3, '2024-01-01', 'ORD003', 100.00),
  (4, '2024-01-01', 'ORD004', 30.25),
  (5, '2024-01-01', 'ORD005', 90.75),
  (6, '2024-01-01', 'ORD006', 25.50),
  (7, '2024-01-01', 'ORD007', 60.00),
  (8, '2024-01-01', 'ORD008', 42.00),
  (9, '2024-01-01', 'ORD009', 120.25),
  (10,'2024-01-01', 'ORD010', 85.00),
  (1, '2024-01-02', 'ORD011', 55.00),
  (1, '2024-01-03', 'ORD012', 80.25),
  (2, '2024-01-03', 'ORD013', 70.00),
  (3, '2024-01-04', 'ORD014', 45.00),
  (1, '2024-01-05', 'ORD015', 95.50),
  (2, '2024-01-05', 'ORD016', 27.50),
  (2, '2024-01-07', 'ORD017', 65.75),
  (2, '2024-01-10', 'ORD018', 75.50);


//PostgreSQL subquery with EXISTS operator

SELECT
    customer_id,
	first_name,
	last_name,
	email
FROM
	customer
WHERE
	EXISTS (
		SELECT
			1
		FROM
			orders
		WHERE
			orders.customer_id = customer.customer_id
	);