CREATE TABLE UserSkills (
    Id SERIAL PRIMARY KEY,
    Skill VARCHAR(255),
    UserId INT REFERENCES "User"(Id)
);
-- Insert data
INSERT INTO UserSkills (Skill, UserId)
VALUES 
('Programming', 1),
('Design', 1),
('Marketing', 2);

-- Update data
UPDATE UserSkills
SET Skill = 'Data Analysis'
WHERE UserId = 1 AND Skill = 'Programming';

-- Delete data
DELETE FROM UserSkills
WHERE UserId = 2 AND Skill = 'Marketing';

-- Sub-queries
-- Get all skills of a user
SELECT *
FROM UserSkills
WHERE UserId = 1;

-- Get users with a specific skill
SELECT UserId
FROM UserSkills
WHERE Skill = 'Design';
