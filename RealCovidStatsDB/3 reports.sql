/*1) How many people got covid twice, and for whoever did get it twice, tell how many of them got it by the 1/2 and then Delta,
how many by the 1/2 and then Omicron, and how many by Delta and then Omicron.*/
select ReceivedCovidTwice = count(*)
from users u
where u.FirstOrSecondWave = 1 and u.DeltaWave = 1  
or u.FirstOrSecondWave = 1 and u.OmicronWave = 1
or u.DeltaWave = 1 and u.OmicronWave = 1

select RecievedFirstOrSecondAndDelta = count(*)
from users u 
where u.FirstOrSecondWave = 1 and u.DeltaWave = 1  

select ReceivedFirstOrSecondAndOmicron = count(*)
from users u 
where u.FirstOrSecondWave = 1 and u.OmicronWave = 1

select ReceivedDeltaAndOmicron = count(*)
from users u 
where u.DeltaWave = 1 and u.OmicronWave = 1

/*2) What were the typical sypmtoms for each age group each wave of covid?*/
select u.ListOfSymptoms, u.DegreeOfSymptom
from users u 
where DATEDIFF(year,UserDOB, u.DateReceivedDisease) between 10 and 70 and u.FirstOrSecondWave = 1

select u.ListOfSymptoms, u.DegreeOfSymptom
from users u 
where DATEDIFF(year,UserDOB, u.DateReceivedDisease) between 10 and 70 and u.DeltaWave = 1

select u.ListOfSymptoms, u.DegreeOfSymptom
from users u 
where DATEDIFF(year,UserDOB, u.DateReceivedDisease) between 10 and 70 and u.OmicronWave = 1

select u.ListOfSymptoms, u.DegreeOfSymptom
from users u 
where DATEDIFF(year,UserDOB, u.DateReceivedDisease) < 10 or DATEDIFF(year,UserDOB, u.DateReceivedDisease) > 70 and u.FirstOrSecondWave = 1
or  DATEDIFF(year,UserDOB, u.DateReceivedDisease) < 10 or DATEDIFF(year,UserDOB, u.DateReceivedDisease) > 70 and u.DeltaWave = 1
or  DATEDIFF(year,UserDOB, u.DateReceivedDisease) < 10 or DATEDIFF(year,UserDOB, u.DateReceivedDisease) > 70  and u.OmicronWave = 1


/*3) Compared to the overall population (that is entered in my system), were the people who were vaccinted more likely, less likely, or equally likely
to get covid for each of the 3 major varients that I collected data about?*/
select count(*)
from users u 
where u.HealthStatus = 'healthy' and u.FirstOrSecondWave = 1

select count (*)
from users u 
where u.VaccinationStatus = 1 and u.FirstOrSecondWave = 1

select count(*)
from users u 
where u.HealthStatus = 'healthy' and u.DeltaWave = 1

select count (*)
from users u 
where u.VaccinationStatus = 1 and u.DeltaWave= 1

select count(*)
from users u 
where u.HealthStatus = 'healthy' and u.OmicronWave = 1

select count (*)
from users u 
where u.VaccinationStatus = 1 and u.OmicronWave = 1
/*4) The same idea as the report before, just this time I want to know about the symptoms of those vaccinated - were they any better or worse than the general population?*/
select u.ListOfSymptoms
from users u 
where u.HealthStatus = 'healthy' and u.FirstOrSecondWave = 1

select u.ListOfSymptoms
from users u 
where u.VaccinationStatus = 1 and u.FirstOrSecondWave = 1

select u.ListOfSymptoms
from users u 
where u.HealthStatus = 'healthy' and u.DeltaWave = 1

select u.ListOfSymptoms
from users u 
where u.VaccinationStatus = 1 and u.DeltaWave = 1

select u.ListOfSymptoms
from users u 
where u.HealthStatus = 'healthy' and u.OmicronWave = 1

select u.ListOfSymptoms
from users u 
where u.VaccinationStatus = 1 and u.OmicronWave = 1