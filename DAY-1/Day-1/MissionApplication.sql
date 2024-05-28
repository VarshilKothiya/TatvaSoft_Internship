create table MissionApplication (
    Id serial primary key,
    MissionId int references Missions(Id),
    UserId int references "User"(Id),
    AppliedDate timestamp not null,
    Status boolean,
    Sheet integer
);

select * from MissionApplication