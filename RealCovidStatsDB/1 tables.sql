use RealCovidStatsDB
go 

drop table if exists users

create table dbo.Users(
   UsersId int not null primary key identity,
   UserFirstName varchar(25) not null constraint ck_users_User_First_Name_cannot_not_blank check(UserFirstName <> ''),
   UserLastName varchar(25) not null constraint ck_users_User_Last_Name_cannot_not_blank check(UserLastName <> ''),
   UserDOB date not null,
   UserSSN char(4) not null constraint ck_users_User_SSN_cannot_be_blank check(UserSSN <> ''),
   HealthStatus varchar(20) not null constraint ck_users_Health_Status_cannot_be_blank check(HealthStatus <> ''),
   FirstOrSecondWave bit not null,
   DeltaWave bit not null,
   OmicronWave bit not null,
   DateReceivedDisease date,
   DegreeOfSymptom varchar(15) constraint ck_users_Degree_of_symptom_are_in_mild_moderate_harsh_extreme_died check(DegreeOfSymptom in ('mild', 'moderate', 'harsh', 'extreme', 'died')),
   LossOfTasteAndSmell bit not null,
   ListOfSymptoms varchar(25) not null constraint ck_users_List_Of_Symptoms_cannot_be_blank check(ListOfSymptoms <> ''),
   VaccinationStatus bit,
   VaccineCompany varchar(25) null,
   DateOfVaccine date null,
   BoosterStatus int constraint ck_users_Booster_Status_must_be_between_zero_and_four check(BoosterStatus between 0 and 4),
   BoosterCompany varchar(25) constraint ck_users_Booster_Company_cannot_be_blank check(BoosterCompany <> ''),
   constraint ck_users_Vaccination_Status_and_Vaccine_Company_and_Date_Of_Vaccine_are_either_all_null_or_all_not_null 
       check(VaccinationStatus = 1 and VaccineCompany is not null and DateOfVaccine is not null or
           VaccinationStatus = 0 and VaccineCompany is null and DateOfVaccine is null),
   constraint ck_users_Booster_Status_and_Booster_Company_are_both_null_or_both_not_null 
       check(BoosterStatus is null and BoosterCompany is null or BoosterStatus is not null and BoosterCompany is not null)
)
go 

insert users(UserFirstName, UserLastName, UserDOB, UserSSN, HealthStatus, FirstOrSecondWave, DeltaWave, OmicronWave, DateReceivedDisease, DegreeOfSymptom, LossOfTasteAndSmell, ListOfSymptoms, VaccinationStatus, VaccineCompany, DateOfVaccine, BoosterStatus, BoosterCompany)
select 
    UserFirstName = m.FirstName,
    UserLastName = m.LastName,
    UserDOB = 
        case 
            when m.Season = 'winter' then concat(m.YearBorn, '-', '01', '-', '01')
            when m.Season = 'spring' then concat(m.YearBorn, '-', '05', '-', '01')
            when m.Season = 'summer' then concat(m.YearBorn, '-', '07', '-', '01')
            when m.Season = 'fall' then concat(m.YearBorn, '-', '10', '-', '01')
        end,
    UserSSN =  m.YearBorn - len(m.FirstName + m.LastName),
    HealthStatus = 
        case 
            when m.Medal = 'gold' then 'healthy'
            when m.Medal = 'silver' then 'hypertension'
            when m.Medal = 'bronze' then 'diabetes'
        end,
    FirstOrSecondWave = 
    case 
        when m.FirstName like '[a-k]%' then 1
        else 0
    end,
    DeltaWave = 
    case
        when m.FirstName like '[l-z]%' then 1
        else 0
    end,
    OmicronWave = 
    case 
        when m.LastName like '[g-q]%' then 1
        else 0
    end,
    DateReceivedDisease = 
    case
        when m.FirstName like '[a-k]%' then '2020-04-14'
        when m.FirstName like '[l-z]%' then '2021-08-20'
        when m.LastName like '[g-q]%' then '2021-11-26'
    end,
    DegreeOfSymptons = 
    case 
        when len(m.FirstName) between 1 and 4 then 'mild'
        when len(m.FirstName) between 5 and 6 then 'moderate'
        when len(m.FirstName) between 7 and 8 then 'harsh'
        when len(m.FirstName) between 9 and 10 then 'extreme'
        when len(m.FirstName) > 11 then 'died'
    end,
    LossOfTasteAndSmell = 
    case 
        when YearBorn % 2 = 0 then 0
        else 1
    end,
    ListOfSymptons =
    case 
        when m.Season = 'winter' then 'chills'
        when m.Season = 'spring' then 'random aches'
        when m.Season = 'summer' then 'high fever'
        when m.Season = 'fall' then 'runny nose'
    end,
    VaccinationStatus = 
    case 
        when m.Country = 'United States' or 
            m.Country = 'Great Britain' or 
            m.Country = 'russia' or 
            m.Country = 'china' 
        then 1
        else 0
    end,
    VaccineCompany = 
    case 
        when m.Country = 'United States' or m.Country = 'Great Britain' then 'Pfizer'
        when m.Country = 'China' then 'Moderna'
        when m.Country = 'Russia' then 'J&J'
    end,
    DateOfVaccine = 
    case
    when m.Country = 'United States' or 
            m.Country = 'Great Britain' or 
            m.Country = 'russia' or 
            m.Country = 'china' 
    then     '01/01/2021' --wrong date inserted. requirement doesn't make senses.
    end,
    BoosterStatus = 
    case 
        when m.Medal = 'gold' then 2
        when m.Medal = 'silver' then 1
        when m.Medal = 'bronze' then 0 
    end,
    BoosterCompany = 
    'moderna' 
from RecordKeeperDB.dbo.medalist m 

select * from users u 