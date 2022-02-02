--1) How many people got covid twice, and for whoever did get it twice, tell how many of them got it by the 1/2 and then Delta,
--how many by the 1/2 and then Omicron, and how many by Delta and then Omicron.
select HowManyPerCombo = COUNT(*), u.FirstOrSecondWave, u.DeltaWave, u.OmicronWave
from Users u 
where (u.FirstOrSecondWave = 1 and u.DeltaWave = 1)
    or (u.FirstOrSecondWave = 1 and u.OmicronWave = 1)
    or (u.DeltaWave = 1 and u.OmicronWave = 1)
group by u.FirstOrSecondWave, u.DeltaWave, u.OmicronWave

--2) What were the typical sypmtoms for each age group each wave of covid?
select AmountPerAgeGroup = COUNT(*), u.ListOfSymptoms, AgeGroup = 
    case 
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 0 and 5 then '0-5'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 6 and 10 then '6-10'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 11 and 20 then '11-20'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 21 and 30 then '21-30'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 31 and 40 then '31-40'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 41 and 50 then '41-50'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 51 and 60 then '51-60'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 61 and 70 then '61-70'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 71 and 75 then '71-75'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 76 and 80 then '76-80'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 81 and 85 then '81-85'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 86 and 90 then '86-90'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 91 and 95 then '91-95'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 96 and 100 then '96-100'
        else 'Over 100'
        end
from Users u 
group by u.ListOfSymptoms,
    case 
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 0 and 5 then '0-5'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 6 and 10 then '6-10'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 11 and 20 then '11-20'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 21 and 30 then '21-30'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 31 and 40 then '31-40'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 41 and 50 then '41-50'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 51 and 60 then '51-60'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 61 and 70 then '61-70'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 71 and 75 then '71-75'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 76 and 80 then '76-80'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 81 and 85 then '81-85'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 86 and 90 then '86-90'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 91 and 95 then '91-95'
        when DATEDIFF(YEAR, u.UserDOB, GETDATE()) between 96 and 100 then '96-100'
        else 'Over 100'
        end
order by AgeGroup

--3) Compared to the overall population (that is entered in my system), were the people who were vaccinted more likely, less likely, or equally likely
--to get covid for each of the 3 major varients that I collected data about?
select NumOfCovidCases = COUNT(*), u.VaccinationStatus, u.FirstOrSecondWave, u.DeltaWave, u.OmicronWave
from Users u 
group by u.VaccinationStatus, u.FirstOrSecondWave, u.DeltaWave, u.OmicronWave
order by NumOfCovidCases desc

select NumOfCovidCases = COUNT(*), u.FirstOrSecondWave, u.DeltaWave, u.OmicronWave
from Users u 
group by u.FirstOrSecondWave, u.DeltaWave, u.OmicronWave
order by NumOfCovidCases desc
--4) The same idea as the report before, just this time I want to know about the symptoms of those vaccinated - were they any better or worse than the general population?
select AmountPerCategory = COUNT(*), u.VaccinationStatus, DegreeOfSymptoms = 
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end
from Users u 
group by u.VaccinationStatus,
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end
order by DegreeOfSymptoms, AmountPerCategory desc, u.VaccinationStatus

select AmountPerCategory = COUNT(*), DegreeOfSymptoms = 
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end
from Users u 
group by
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end
order by DegreeOfSymptoms, AmountPerCategory desc
--Please ensure to also include in the reports the relationship between each underlying condtion and the degree of syptoms, 
--compared to how common the same system was with the general public.

select AmountPerCategory = COUNT(*), u.HealthStatus, DegreeOfSymptoms = 
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end
from Users u 
group by u.HealthStatus, 
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end

select AmountPerCategory = COUNT(*), DegreeOfSymptoms = 
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end
from Users u 
group by 
    case 
        when u.FirstOrSecondWaveDegreeOfSymptom = 'mild' or u.DeltaWaveDegreeOfSymptom = 'mild' or u.OmicronWaveDegreeOfSymptom = 'mild' then '1-mild'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'moderate' or u.DeltaWaveDegreeOfSymptom = 'moderate' or u.OmicronWaveDegreeOfSymptom = 'moderate' then '2-moderate'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'harsh' or u.DeltaWaveDegreeOfSymptom = 'harsh' or u.OmicronWaveDegreeOfSymptom = 'harsh' then '3-harsh'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'extreme' or u.DeltaWaveDegreeOfSymptom = 'extreme' or u.OmicronWaveDegreeOfSymptom = 'extreme' then '4-extreme'
        when u.FirstOrSecondWaveDegreeOfSymptom = 'died' then '5-died'
    end