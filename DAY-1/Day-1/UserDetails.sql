create table UserDetails(
	Id serial primary key,
	UserId integer references "User"(Id),
	"Name" character varying,
	Surname character varying,
	EmployeeId character varying,
	Manager character varying,
	Title character varying,
	Department character varying,
	MyProfile text,
	WhyIVolunteer text,
	CountryId integer references Country(Id),
	CityId integer references City(Id),
	Availability text,
	LinkedInUrl text,
	MySkills text,
	UserImage text,
	Status boolean
);

select * from UserDetails