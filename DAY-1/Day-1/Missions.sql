CREATE TABLE Missions (
    Id SERIAL PRIMARY KEY,
    MissionTitle VARCHAR(255),
    MissionDescription TEXT,
    MissionOrganisationName VARCHAR(255),
    MissionOrganisationDetail TEXT,
    CountryId INT,
    CityId INT,
    StartDate DATE,
    EndDate DATE,
    MissionType VARCHAR(255),
    TotalSheets INT,
    RegistrationDeadline DATE,
    MissionThemeId VARCHAR(255),
    MissionSkillId VARCHAR(255),
    MissionImages TEXT,
    MissionDocuments TEXT,
    MissionAvailability TEXT,
    MissionVideoUrl VARCHAR(255)
);
-- Insert data
INSERT INTO Missions (
    MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail,
    CountryId, CityId, StartDate, EndDate, MissionType, TotalSheets,
    RegistrationDeadline, MissionThemeId, MissionSkillId, MissionImages,
    MissionDocuments, MissionAvailability, MissionVideoUrl
) VALUES (
    'Mission Title', 'Mission Description', 'Organization Name', 'Organization Detail',
    1, 1, '2024-06-01', '2024-06-15', 'Type', 10,
    '2024-05-30', 'Theme1', 'Skill1', 'image.jpg',
    'document.pdf', 'Available', 'video_url'
);

-- Update data
UPDATE Missions
SET MissionTitle = 'New Title', MissionDescription = 'New Description'
WHERE Id = 1;

-- Delete data
DELETE FROM Missions
WHERE Id = 1;

-- Sub-queries
-- Get missions with a specific mission type
SELECT *
FROM Missions
WHERE MissionType = 'Type';

-- Get missions with a registration deadline after a specific date
SELECT *
FROM Missions
WHERE RegistrationDeadline > '2024-05-30';

-- Get missions in a specific country
SELECT *
FROM Missions
WHERE CountryId = 1;

-- Get missions with a specific theme
SELECT *
FROM Missions
WHERE MissionThemeId = 'Theme1';
