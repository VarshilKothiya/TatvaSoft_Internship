create table "User"(
	Id serial primary key,
	FirstName character varying not null,
	LastName character varying not null,
	PhoneNumber character varying(10),
	EmailAddress character varying not null unique,
	UserType character varying,
	"Password" text
);

select * from "User"