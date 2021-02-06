use WFA3DotNet

Create Table tblCountries
(
 CountryId int identity primary key,
 CountryName nvarchar(50)
)

Insert into tblCountries values ('India')
Insert into tblCountries values ('America')
Insert into tblCountries values ('china')


select * from tblCountries

Create Table tblStates
(
 StateId int identity primary key,
 StateName nvarchar(50),
 CountryId int foreign key references dbo.tblCountries(CountryId)
)

Insert into tblStates values ('Andhra Pradesh', 1)
Insert into tblStates values ('Maharastra', 1)
Insert into tblStates values ('Tamil Naidu', 1)

Insert into tblStates values ('New York', 2)
Insert into tblStates values ('Washington', 2)
Insert into tblStates values ('Chicago', 2)

Insert into tblStates values ('Hubel', 3)
Insert into tblStates values ('Hunan', 3)
Insert into tblStates values ('Beijing', 3)

select * from tblStates


Create Table tblCities
(
 CityId int identity primary key,
 CityName nvarchar(50),
 StateId int foreign key references dbo.tblStates(StateId)
)

Insert into tblCities values ('Vijayawada', 1)
Insert into tblCities values ('Ongole', 1)
Insert into tblCities values ('Visakapatnam', 1)

Insert into tblCities values ('Mumbai', 2)
Insert into tblCities values ('Pune', 2)
Insert into tblCities values ('Nagpur', 2)

Insert into tblCities values ('Chennai', 3)
Insert into tblCities values ('Madurai', 3)
Insert into tblCities values ('Vellore', 3)

Insert into tblCities values ('Albany', 4)
Insert into tblCities values ('Yonkers', 4)
Insert into tblCities values ('Utica', 4)

Insert into tblCities values ('Seattle', 5)
Insert into tblCities values ('Olympia', 5)
Insert into tblCities values ('Everett', 5)

Insert into tblCities values ('Chicago Illinois', 6)
Insert into tblCities values ('Aurora Illinois', 6)
Insert into tblCities values ('Naperville Illinois', 6)

Insert into tblCities values ('Wuhan', 7)
Insert into tblCities values ('Yichang', 7)
Insert into tblCities values ('Ezhou', 7)

Insert into tblCities values ('Changsa', 8)
Insert into tblCities values ('Changde', 8)
Insert into tblCities values ('Yiyang', 8)

Insert into tblCities values ('Hunan', 9)
Insert into tblCities values ('Hong kong', 9)
Insert into tblCities values ('Shanghai', 9)

select * from tblCities

create procedure spGetCountries
as
Begin
 Select CountryId, CountryName from tblCountries
End

Create procedure spGetStatesByCountryId
@CountryId int
as
Begin
 Select StateId, StateName from tblStates
 where CountryId = @CountryId
End

Create procedure spGetCitiesByStateId
@StateId int
as
Begin
 Select CityId, CityName from tblCities
 where StateId = @StateId
End