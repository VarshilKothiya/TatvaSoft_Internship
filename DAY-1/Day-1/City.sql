-- Create the table
CREATE TABLE City (
    Id SERIAL PRIMARY KEY,
    CountryId INT NOT NULL,
    CityName VARCHAR(255) NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Country(Id)
);

-- Insert data
INSERT INTO City (CountryId, CityName) VALUES (1, 'New York');
INSERT INTO City (CountryId, CityName) VALUES (1, 'Los Angeles');
INSERT INTO City (CountryId, CityName) VALUES (2, 'Toronto');

-- Update data
UPDATE City
SET CityName = 'San Francisco'
WHERE Id = 2;

-- Delete data
DELETE FROM City
WHERE Id = 3;

-- Query data
-- Select all data
SELECT * FROM City;

-- Select specific column
SELECT CityName FROM City;

-- Sub-query example
SELECT CityName FROM City
WHERE CountryId = (SELECT Id FROM Country WHERE CountryName = 'United States of America');
