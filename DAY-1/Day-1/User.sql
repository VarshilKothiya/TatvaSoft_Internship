CREATE TABLE "User" (
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    PhoneNumber VARCHAR(20),
    EmailAddress VARCHAR(255),
    UserType VARCHAR(50),
    Password VARCHAR(255)
);
-- Insert data
INSERT INTO "User" (FirstName, LastName, PhoneNumber, EmailAddress, UserType, Password)
VALUES 
('John', 'Doe', '1234567890', 'john@example.com', 'Regular', 'password123'),
('Jane', 'Smith', '0987654321', 'jane@example.com', 'Admin', 'admin123');

-- Update data
UPDATE "User"
SET PhoneNumber = '9876543210'
WHERE EmailAddress = 'john@example.com';

-- Delete data
DELETE FROM "User"
WHERE EmailAddress = 'jane@example.com';

-- Sub-queries
-- Get all users of a specific type
SELECT *
FROM "User"
WHERE UserType = 'Regular';

-- Get a user by email address
SELECT *
FROM "User"
WHERE EmailAddress = 'john@example.com';
