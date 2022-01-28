
--Reports:

/*1) How many people got covid twice, and for whoever did get it twice, tell how many of them got it by the 1/2 and then Delta,
how many by the 1/2 and then Omicron, and how many by Delta and then Omicron.*/

select c.FirstName, c.LastName, c.DOB, c.HalfWave, c.DeltaWave, c.OmicronWave
from CovidStats c 
where (c.HalfWave = 'Y' and (c.DeltaWave = 'Y' or c.OmicronWave = 'Y'))
or (c.DeltaWave = 'Y' and c.OmicronWave = 'Y')

select HalfAndDelta = count(*)
from CovidStats c 
where c.HalfWave = 'Y' and c.DeltaWave = 'Y' 

select HalfAndOmricon = count(*)
from CovidStats c 
where c.HalfWave = 'Y' and c.OmicronWave = 'Y' 

select DeltaAndOmricon = count(*)
from CovidStats c 
where c.DeltaWave = 'Y' and c.OmicronWave = 'Y'

/*2) What were the typical sypmtoms for each age group each wave of covid?*/
--not sure for this question. spoke to hw markers question not clear for assistance. what are you looking for?
select AgeContractCovid = datediff(year,c.DOB, c.DateContractedVirus), c.CommonSymptoms, c.HalfWave, DeltaWave, c.OmicronWave, 
AgeGroup = 
    case
        when datediff(year,c.DOB, c.DateContractedVirus) between 0 and 5 then 0-5
        when datediff(year,c.DOB, c.DateContractedVirus) between 6 and 10 then 6-10
        when datediff(year,c.DOB, c.DateContractedVirus) between 11 and 15 then 11-15
        when datediff(year,c.DOB, c.DateContractedVirus) between 16 and 20 then 16-20
        when datediff(year,c.DOB, c.DateContractedVirus) between 21 and 25 then 21-25
        when datediff(year,c.DOB, c.DateContractedVirus) between 25 and 30 then 26-30
        when datediff(year,c.DOB, c.DateContractedVirus) between 31 and 35 then 31-35
        when datediff(year,c.DOB, c.DateContractedVirus) between 36 and 40 then 36-40
        when datediff(year,c.DOB, c.DateContractedVirus) between 41 and 45 then 41-45
        when datediff(year,c.DOB, c.DateContractedVirus) between 46 and 50 then 46-50
        when datediff(year,c.DOB, c.DateContractedVirus) between 51 and 55 then 51-55
        when datediff(year,c.DOB, c.DateContractedVirus) between 56 and 60 then 56-60
        when datediff(year,c.DOB, c.DateContractedVirus) between 61 and 65 then 61-65
        when datediff(year,c.DOB, c.DateContractedVirus) between 66 and 70 then 66-70
        when datediff(year,c.DOB, c.DateContractedVirus) between 71 and 75 then 71-75
        when datediff(year,c.DOB, c.DateContractedVirus) between 76 and 80 then 76-80
        when datediff(year,c.DOB, c.DateContractedVirus) between 81 and 85 then 81-85
        when datediff(year,c.DOB, c.DateContractedVirus) between 86 and 90 then 86-90
        when datediff(year,c.DOB, c.DateContractedVirus) between 91 and 95 then 91-95
        when datediff(year,c.DOB, c.DateContractedVirus) between 96 and 100 then 96-100
    end 
from CovidStats c 
group by datediff(year,c.DOB, c.DateContractedVirus), c.CommonSymptoms, c.HalfWave, DeltaWave, c.OmicronWave,    
    case
        when datediff(year,c.DOB, c.DateContractedVirus) between 0 and 5 then 0-5
        when datediff(year,c.DOB, c.DateContractedVirus) between 6 and 10 then 6-10
        when datediff(year,c.DOB, c.DateContractedVirus) between 11 and 15 then 11-15
        when datediff(year,c.DOB, c.DateContractedVirus) between 16 and 20 then 16-20
        when datediff(year,c.DOB, c.DateContractedVirus) between 21 and 25 then 21-25
        when datediff(year,c.DOB, c.DateContractedVirus) between 25 and 30 then 26-30
        when datediff(year,c.DOB, c.DateContractedVirus) between 31 and 35 then 31-35
        when datediff(year,c.DOB, c.DateContractedVirus) between 36 and 40 then 36-40
        when datediff(year,c.DOB, c.DateContractedVirus) between 41 and 45 then 41-45
        when datediff(year,c.DOB, c.DateContractedVirus) between 46 and 50 then 46-50
        when datediff(year,c.DOB, c.DateContractedVirus) between 51 and 55 then 51-55
        when datediff(year,c.DOB, c.DateContractedVirus) between 56 and 60 then 56-60
        when datediff(year,c.DOB, c.DateContractedVirus) between 61 and 65 then 61-65
        when datediff(year,c.DOB, c.DateContractedVirus) between 66 and 70 then 66-70
        when datediff(year,c.DOB, c.DateContractedVirus) between 71 and 75 then 71-75
        when datediff(year,c.DOB, c.DateContractedVirus) between 76 and 80 then 76-80
        when datediff(year,c.DOB, c.DateContractedVirus) between 81 and 85 then 81-85
        when datediff(year,c.DOB, c.DateContractedVirus) between 86 and 90 then 86-90
        when datediff(year,c.DOB, c.DateContractedVirus) between 91 and 95 then 91-95
        when datediff(year,c.DOB, c.DateContractedVirus) between 96 and 100 then 96-100
    end 

/*3) Compared to the overall population (that is entered in my system), were the people who were vaccinted more likely, less likely, or equally likely
to get covid for each of the 3 major varients that I collected data about?*/
--plz clarify this question 
select * 
from CovidStats c 
where c.BoosterStatus = 
    case   
        when c.BoosterStatus = 2 then 'Likely' 
        when c.BoosterStatus = 1 then 'More Likely'
        when c.BoosterStatus = 0 then 'Equally Likely' 
    end

select * from CovidStats c 
/*4) The same idea as the report before, just this time I want to know about the symptoms of those vaccinated - were they any better or worse than the general population?*/
--plz clarify prior question
select * 
from CovidStats c 
where c.BoosterStatus = 
    case   
        when c.BoosterStatus = 2 then 'Likely' 
        when c.BoosterStatus = 1 then 'More Likely'
        when c.BoosterStatus = 0 then 'Equally Likely' 
    end