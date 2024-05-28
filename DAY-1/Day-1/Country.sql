-- Create the table
CREATE TABLE Country (
    Id SERIAL PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);

-- Insert data
INSERT INTO Country (CountryName) VALUES ('United States');
INSERT INTO Country (CountryName) VALUES ('Canada');
INSERT INTO Country (CountryName) VALUES ('Mexico');

-- Update data
UPDATE Country
SET CountryName = 'United States of America'
WHERE Id = 1;

-- Delete data
DELETE FROM Country
WHERE Id = 3;

-- Query data
-- Select all data
SELECT * FROM Country;

-- Select specific column
SELECT CountryName FROM Country;

-- Sub-query example
SELECT * FROM Country
WHERE CountryName LIKE '%United%';
