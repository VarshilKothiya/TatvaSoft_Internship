CREATE TABLE UserDetail (
    Id SERIAL PRIMARY KEY,
    UserId INT REFERENCES "User"(Id),
    Name VARCHAR(255),
    Surname VARCHAR(255),
    EmployeeId VARCHAR(50),
    Manager VARCHAR(255),
    Title VARCHAR(255),
    Department VARCHAR(255),
    MyProfile TEXT,
    WhyIVolunteer TEXT,
    CountryId INT,
    CityId INT,
    Availability VARCHAR(255),
    LinkedInUrl VARCHAR(255),
    MySkills TEXT,
    UserImage VARCHAR(255),
    Status BOOLEAN
);
-- Insert data
INSERT INTO UserDetail (
    UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile,
    WhyIVolunteer, CountryId, CityId, Availability, LinkedInUrl, MySkills,
    UserImage, Status
) VALUES (
    1, 'John', 'Doe', 'EMP123', 'Jane Smith', 'Software Engineer', 'IT',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'I volunteer because...', 1, 1, 'Full-time', 'https://www.linkedin.com/in/johndoe',
    'Programming, Design', 'image.jpg', TRUE
);

-- Update data
UPDATE UserDetail
SET Availability = 'Part-time'
WHERE UserId = 1;

-- Delete data
DELETE FROM UserDetail
WHERE UserId = 1;

-- Sub-queries
-- Get user details by user ID
SELECT *
FROM UserDetail
WHERE UserId = 1;

-- Get all users with full-time availability
SELECT *
FROM UserDetail
WHERE Availability = 'Full-time';
