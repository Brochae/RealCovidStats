select m.FirstName
from medalist m 
where m.FirstName like '[abcde]%'

select case m.season 
when 'Winter' then DateFromParts(datepart(yy, m.yearborn),'12','01')
when 'Spring' then DateFromParts(datepart(yy, m.yearborn),'05','01')
when 'Summer' then DateFromParts(datepart(yy, m.yearborn),'07','01')
when 'Fall' then DateFromParts(datepart(yy, m.yearborn),'10','01')
end
from Medalist m 

select m.FirstName, m.LastName, DOB = 

from Medalist m 
order by m.YearBorn


case m.season =
when 'Winter' then DateFromParts(datepart(yy, m.yearborn),'12','01')
when 'Spring' then DateFromParts(datepart(yy, m.yearborn),'05','01')
when 'Summer' then DateFromParts(datepart(yy, m.yearborn),'07','01')
when 'Fall' then DateFromParts(datepart(yy, m.yearborn),'10','01')
end

select VaccinationDate = DateFromParts(2021,
    case m.Season
        when 'Summer' then 7
        when 'Fall' then 10
        when 'Spring' then 5
        when 'Winter' then 1
    end,
1)
from Medalist m 
order by VaccinationDate

select * from Medalist m where m.Season = 'Spring'