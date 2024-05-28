CREATE TABLE MissionTheme (
    Id SERIAL PRIMARY KEY,
    ThemeName VARCHAR(255),
    Status VARCHAR(50)
);
-- Insert data
INSERT INTO MissionTheme (ThemeName, Status)
VALUES 
('Education', 'Active'),
('Healthcare', 'Active'),
('Environment', 'Inactive');

-- Update data
UPDATE MissionTheme
SET Status = 'Active'
WHERE ThemeName = 'Environment';

-- Delete data
DELETE FROM MissionTheme
WHERE ThemeName = 'Environment';

-- Sub-queries
-- Get all active themes
SELECT *
FROM MissionTheme
WHERE Status = 'Active';

-- Get a specific theme by name
SELECT *
FROM MissionTheme
WHERE ThemeName = 'Education';
