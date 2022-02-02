select yeaborn  % 2

select * from medalist m 


use RecordKeeperDB
go
drop table if exists Medalist
go
create table dbo.Medalist(
	MedalistId int not null identity primary key,
	OlympicYear int not null constraint ck_Medalist_OlympicYear_must_1896_or_greater check(OlympicYear >= 1896),
	Season varchar (50) not null constraint ck_Medalist_Season_cannot_be_blank check(Season <> ''),
	OlympicLocation varchar (100) not null constraint ck_Medalist_OlympicLocation_cannot_be_blank check(OlympicLocation <> ''),
	Sport varchar (100) not null constraint ck_Medalist_Sport_cannot_be_blank check(Sport <> ''),
	SportSubcategory varchar (100) not null constraint ck_Medalist_SportSubCategory_cannot_be_blank check(SportSubcategory <> ''),
	Medal varchar (6) not null constraint ck_Medalist_Medal_cannot_be_blank check(Medal <> ''),
	FirstName varchar (50) not null constraint ck_Medalist_FirstName_cannot_be_blank check(FirstName <> ''),
	LastName varchar (50) not null constraint ck_Medalist_LastName_cannot_be_blank check(LastName <> ''),
	Country varchar (50) not null constraint ck_Medalist_Country_cannot_be_blank check(Country <> ''),
	YearBorn int not null constraint ck_Medalist_Yearborn_must_be_greater_than_zero check(YearBorn > 0),
		constraint ck_Medalist_YearBorn_must_be_before_OlympicYear check(YearBorn < OlympicYear),
		constraint ck_Medalist_Yearborn_OlympicYear_age_must_greater_than_fourteen check(OlympicYear - YearBorn >= 14),
	constraint ck_Medalist_Sport_Boxing_and_age_must_be_between_eighteen_and_forty_years_old_to_compete check(not((sport = 'Boxing' and OlympicYear - YearBorn not between 18 and 40))),
--AS The constraint was that Gymnasts must be at least 16 years old in order to compete. Yours is missing the gymnast part.	
	constraint ck_Medalist_Sport_Gymnastics_must_be_greater_or_equal_to_sixteen check(not (Sport = 'Gymnastics' and not OlympicYear - YearBorn >= 16)),
	constraint u_Medalist_OlympicYear_and_Medal_and_Sport_and_Sportsubcategory_must_be_unique unique(OlympicYear, Medal, Sport, SportSubcategory)
)
go

	alter table Medalist drop column if exists AgeWonMedal
	alter table Medalist add AgeWonMedal as OlympicYear - YearBorn persisted 

	alter table Medalist drop column if exists MedalistInformation
	alter table Medalist add MedalistInformation as 
      concat(Medal,' - ', left(FirstName, 1),'.', left(LastName, 1),'. : ', OlympicYear)

	alter table Medalist drop column if exists GoldMedalist
	alter table Medalist add GoldMedalist as 
       case medal when 'gold' then 1 else 0 end 

	alter table medalist drop constraint if exists d_Medalist_MedalistAddress
	alter table Medalist drop column if exists MedalistAddress
	alter table Medalist add MedalistAddress varchar(40) not null constraint d_Medalist_MedalistAddress default ''

	alter table president drop column if exists AgeAtDeath
	alter table president add AgeAtDeath as year(DateDied) - year(DateBorn) persisted

	alter table president drop column if exists YearsServed
	alter table president add YearsServed as TermEnd - TermStart persisted

	alter table President drop column if exists NumberofFullTermServed 
	alter table President add  NumberofFullTermServed as 
    case TermEnd - TermStart 
      when 4 then 1 
      when 8 then 2 
      when 12 then 3 
      else 0 
      end
