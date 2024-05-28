CREATE TABLE MissionSkill (
    Id SERIAL PRIMARY KEY,
    SkillName VARCHAR(255),
    Status VARCHAR(50)
);
-- Insert data
INSERT INTO MissionSkill (SkillName, Status)
VALUES 
('Programming', 'Active'),
('Design', 'Active'),
('Marketing', 'Inactive');

-- Update data
UPDATE MissionSkill
SET Status = 'Active'
WHERE SkillName = 'Marketing';

-- Delete data
DELETE FROM MissionSkill
WHERE SkillName = 'Marketing';

-- Sub-queries
-- Get all active skills
SELECT *
FROM MissionSkill
WHERE Status = 'Active';

-- Get a specific skill by name
SELECT *
FROM MissionSkill
WHERE SkillName = 'Programming';
