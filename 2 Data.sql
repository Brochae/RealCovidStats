delete CovidStats

insert CovidStats(FirstName, LastName, DOB, SSN, HalfWave, DeltaWave, OmicronWave, DegreeOfSymptoms, LostTasteOrSmell, CommonSymptoms, DateContractedVirus, PreExistingCondition, VaccinationStatus, VaccineDate, VaccineCompany, BoosterStatus, BoosterCompany)
select m.FirstName, 
m.LastName,
DOB = DATEFROMPARTS(
    case   
        when RIGHT(m.YearBorn, 2) > 22 then CONCAT(19, CONVERT(int, RIGHT(m.YearBorn, 2)))
        when RIGHT(m.YearBorn, 2) < 10 then CONCAT(200, CONVERT(int, RIGHT(m.YearBorn, 2)))
        else CONCAT(20, CONVERT(int, RIGHT(m.YearBorn, 2)))
    end, 
    case m.Season
        when 'Summer' then 7
        when 'Fall' then 10
        when 'Spring' then 5
        when 'Winter' then 1
    end, 1),
SSN = m.YearBorn - (len(LastName)+ len(FirstName)),
HalfWave =
    case 
        when m.FirstName like '[a-k]%' then 'Y' 
        else 'N'  
    end,
DeltaWave =
    case 
        when m.FirstName like '[l-z]%' then 'Y' 
        else 'N'  
    end,
OmicronWave =
    case  
        when m.LastName like'[g-q]%' then 'Y'  
        else 'N'
    end, 
DegreeOfSymptoms =
    case 
        when len(m.FirstName) between 1 and 4 then 'Mild'
        when len(m.FirstName) between 5 and 6 then 'Moderate'
        when len(m.FirstName) between 7 and 8 then 'Harsh'
        when len(m.FirstName) between 9 and 10 then 'Extreme'
        when len(m.LastName) >10 then 'Died'
    end,
LostTasteOrSmell =
    case m.YearBorn % 2 
        when 1 then 'Y'
        else 'N'
    end,
CommonSymptoms =
   case 
        when m.Season = 'Winter' then 'Chills'
        when m.Season = 'Spring' then 'Random Aches'
        when m.Season = 'Summer' then 'High Fever'
        when m.Season = 'Fall' then 'Runny Nose'
   end,
DateContractedVirus =
    case 
        when m.FirstName like '[a-k]%' then '2020-04-14'
        when m.FirstName like '[l-z]%' then '2021-08-20'
        when m.LastName like'[g-q]%' then '2021-11-26'
    end,
PreExistingCondition =
    case 
        when m.Medal = 'Silver' then 'HTN'
        when m.Medal = 'Bronze' then 'Diabetes'
        when m.Medal = 'Gold' then 'Healthy'
    end,
VaccinationStatus = 
    case 
        when m.Country in ('United States', 'Great Britian', 'Soviet Union', 'China') then 'Y'
        else 'N'
    end,
VaccineDate = DateFromParts(2021,
    case m.Season
        when 'Summer' then 7
        when 'Fall' then 10
        when 'Spring' then 5
        when 'Winter' then 1
    end, 1),
VaccineCompany =
    case 
        when m.Country in ('United States', 'Great Britian','China') then 'Moderna'
        when m.Country = 'Soviet Union' then 'J&J'
    end,
BoosterStatus =
    case 
        when m.Medal = 'Gold' then 2
        when m.Medal = 'Silver' then 1
        when m.Medal = 'Bronze' then 0
    end,
BoosterCompany =
    case 
        when m.Medal = 'Gold' then 'Moderna'
        when m.Medal = 'Silver' then 'Moderna'
    end
from dbo.Medalist m 