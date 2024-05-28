create table Missions (
    Id serial primary key,
	MissionTitle character varying not null,
	MissionDescription text,
	MissionOrganizationName character varying,
	MissionOrganizationDetails text,
	CountryId integer references Country(Id),
	CityId integer references City(Id),
	StartDate date not null,
	EndDate date not null,
	MissionType character varying(200),
	TotalSheets integer,
	RegistrationDeadLine date,
	MissionThemeId integer references MissionTheme(Id),
	MissionSkillId integer references MissionSkill(Id),
	MissionImage text,
	MissionDocuments text,
	MissionAvilability text,
	MissionVideoUrl text
);

select * from Missions