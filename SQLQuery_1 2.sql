select
 case m.YearBorn % 2 
        when  1 then 'Yes'
        else 'No'
    end
    from Medalist m 

    select datediff(year, c.Dob,getdate()) 

    from covidstats c 

  where  ntile(5) over(order by datediff(year, c.Dob,getdate()))

  select datediff(year, c.Dob,getdate()) ,datediff(year, c.Dob,getdate()) % 5 

    from covidstats c 
    where datediff(year, c.Dob,getdate()) / 5 

select *
from CovidStats c 
where c.boosterstatus = case   
    when c.BoosterStatus=2 then 'Less Likely'
    when c.BoosterStatus=1 then 'More Likely'
    when c.BoosterStatus=0 then 'Equally Likely' 
end

