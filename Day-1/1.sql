-- Create New Table
CREATE TABLE information (
   customer_id serial PRIMARY KEY,
   first_name character varying(100) NOT NULL,
   last_name character varying(100) NOT NULL,
   email character varying(255) UNIQUE NOT NULL,
   created_date timestamp with time zone NOT NULL DEFAULT now(),
   updated_date timestamp with time zone
);

SELECT * FROM information

-- Drop Table
DROP TABLE IF EXISTS information;

-- Add New Column
ALTER TABLE information ADD COLUMN active boolean;

-- Drop New Column
ALTER TABLE information DROP COLUMN active;

-- After Delete Column - Select Statement
SELECT * from information

-- Rename Existing Column
ALTER TABLE information RENAME COLUMN email TO email_address;

-- After Rename Column - Select Statement
SELECT * from information

ALTER TABLE information RENAME COLUMN email_address TO email;

-- Rename table name
ALTER TABLE information RENAME TO users;

ALTER TABLE users RENAME TO information;

-- Create New  Table
CREATE TABLE ordered (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    order_date timestamp with time zone NOT NULL DEFAULT now(),
    order_number CHARACTER VARYING(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

