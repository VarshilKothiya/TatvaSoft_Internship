create table UserSkills(
	Id serial primary key,
	Skills character varying not null,
	UserId integer references "User"(Id)
);

select * from UserSkills