create table City(
	Id serial primary key,
	CountryId integer not null REFERENCES Country(Id),
	CityName character varying(100) not null
);

select * from City