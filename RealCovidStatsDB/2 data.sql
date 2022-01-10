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