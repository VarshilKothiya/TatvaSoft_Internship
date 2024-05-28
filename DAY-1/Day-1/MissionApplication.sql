-- Create the table
CREATE TABLE MissionApplication (
    Id SERIAL PRIMARY KEY,
    MissionId INT NOT NULL,
    UserId INT NOT NULL,
    AppliedDate TIMESTAMP NOT NULL,
    Status BOOLEAN NOT NULL,
    Sheet INT
);

-- Insert data
INSERT INTO MissionApplication (MissionId, UserId, AppliedDate, Status, Sheet)
VALUES 
(1, 101, '2024-05-28 14:30:00', TRUE, 5),
(2, 102, '2024-05-28 15:00:00', FALSE, 3),
(3, 103, '2024-05-28 16:00:00', TRUE, 2);

-- Update data
UPDATE MissionApplication
SET Status = FALSE, Sheet = 4
WHERE Id = 1;

-- Delete data
DELETE FROM MissionApplication
WHERE Id = 2;

-- Sub-queries
-- Get all applications with a specific status
SELECT *
FROM MissionApplication
WHERE Status = TRUE;

-- Get the number of applications per mission
SELECT MissionId, COUNT(*) AS ApplicationCount
FROM MissionApplication
GROUP BY MissionId;

-- Get applications made after a specific date
SELECT *
FROM MissionApplication
WHERE AppliedDate > '2024-05-28 15:00:00';

-- Get applications with the highest sheet number
SELECT *
FROM MissionApplication
WHERE Sheet = (SELECT MAX(Sheet) FROM MissionApplication);
