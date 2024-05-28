create table MissionSkill(
	Id serial primary key,
	SkillName character varying(255) not null,
	Status character varying
);

select * from MissionSkill