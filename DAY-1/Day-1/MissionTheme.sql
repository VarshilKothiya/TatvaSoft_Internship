create table MissionTheme(
	Id serial primary key,
	ThemeName character varying(255) not null,
	Status character varying
);

select * from MissionTheme