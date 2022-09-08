-- SELECTS THE DATABASE
use nishit


/*
BELOW GIVEN QUERIES ARE USED FOR TABLEAU PROJECT
*/


-- PRINTS EVERY VALUE IN TABLE
select *
from covidcases
where continent is not null
order by 1,2;


-- ( PAGE 1 )

--TOTAL CASES, TOTAL DEATHS and DEATH PERCENTAGE PER LOCATION

select location, max(total_cases) as TotalCases, max(total_deaths) as Total_Death, max(total_deaths)/max(total_cases)*100 as DeathPercentage
from covidcases
where continent is not null
group by location
order by max(total_deaths)/max(total_cases)*100 desc



-- PERCENTAGE OF POPULATION INFECTED BY:
    
	-- 1) CONTINENT
	    
		  select location, sum(new_cases)/Max(population)*100 as PercentageInfected
		  from covidcases
		  where continent is null
		  group by location
		  order by sum(new_cases)/Max(population)*100 desc


	-- 2) LOCATION
	    
		  select location, sum(new_cases)/Max(population)*100 as PercentageInfected, sum(new_cases) as TotalCases
		  from covidcases
		  where continent is not null
		  group by location
		  order by sum(new_cases) desc


-- TOP 5 MOST AFFECTED COUNTRIES

 select top 5 Location, max(total_cases) as PopulationInfected
from covidcases
where continent is not null
group by location 
order by max(total_cases) desc


-- TOP 5 COUNTRIES WITH MAXIMUM DEATHS

select top 5 location, sum(new_deaths) as TotalDeaths
from covidcases
where continent is not null
group by location
order by sum(new_deaths) desc


--GLOBAL DATA:

   -- 1) TOTAL CASES

         select sum(new_cases) as GlobalCases
		 from covidcases 
		 where continent is not null
		 

   -- 2) TOTAL DEATHS

         select sum(new_deaths) as Globaldeaths
		 from covidcases 
		 where continent is not null




-- ( PAGE 2 )

--GLOBAL NUMBERS 

select  date , sum(new_cases) as TotalCases,  sum(new_deaths) as TotalDeaths , sum(new_deaths)/sum(new_cases)*100 as ChancesOfDeath
from covidcases
where continent is not null
group by date
order by date




-- ( PAGE 3 )


-- USED TO GET LOCATION WISE VACCINATION DATA

select covidcases.location, covidcases.population, max(covidvaccine.people_vaccinated) as PeopleVaccinated, max(covidvaccine.people_fully_vaccinated) as PeopleFullyVaccinated
from covidcases
join covidvaccine on covidcases.location = covidvaccine.location
where covidcases.continent is not null
group by covidcases.location, covidcases.population
order by max(covidvaccine.people_vaccinated) desc



















/*
BELOW GIVEN QUERIES ARE NOT USED IN TABLEAU PROJECT
*/



--Total cases Vs Total deaths and death percentage per continent

select location, max(total_cases) as TotalCases, max(total_deaths) as Total_Death, max(total_deaths)/max(total_cases)*100 as DeathPercentage
from covidcases
where continent is null
group by location
order by max(total_deaths)/max(total_cases)*100 desc

select location, max(total_cases)
from covidcases
where continent is not null
group by location
order by max(total_cases) desc





select *
from covidcases
where continent is null

select * 
from covidcases

select count(continent) as continent, count(location) as location, count(date) as date, count(population) as population, count(total_cases) as totalcases, count(new_cases) as newcases, count(total_deaths) as totaldeaths, count(new_deaths) as newdeaths
from covidcases



--POPULATION OF EACH COUNTRY
select max(population) as population, location
from covidcases
where continent is not null
group by location
order by max(population) desc



-- TOTAL CASES BY 
   -- 1) CONTINENT
          
		select location, sum(new_cases) as TotalCases
		from covidcases 
		where continent is null
		group by location
		order by sum(new_cases) desc

   -- 2) LOCATION
	     
		 select location, sum(new_cases) as TotalCases 
		 from CovidCases
		 where continent is not null
		 group by location
		 order by sum(new_cases) desc

		 

-- TOTAL DEATHS BY:
   -- 1) CONTINENT
         
		 select location, sum(new_deaths) as TotalDeaths
		 from covidcases
		 where continent is null
		 group by location
		 order by sum(new_deaths) desc
		 
    -- 2) LOCATION
         
		 select location, sum(new_deaths) as TotalDeaths
		 from covidcases
		 where continent is not null
		 group by location
		 order by sum(new_deaths) desc






		
-- PERCENT POPULATION DEAD BY:
    -- 1) CONTINENT
	     
		  select location, max(total_deaths)/max(population)*100 as PercentageDead
		  from CovidCases
		  
		  group by location
		  order by max(total_deaths)/max(population)*100 desc
	
    -- 2) LOCATION
	     
		  select location, max(total_deaths)/max(population)*100 as PercentageDead
		  from CovidCases
		  where continent is not null
		  group by location
		  order by max(total_deaths)/max(population)*100 desc		




--CHANCES OF DYING IF INFECTED BY COVID BY:
     -- 1) CONINENT
 
          select sum(new_deaths)/sum(new_cases)*100 as ChancesOfDeath_IfInfected, LOCATION
          from covidcases
          where continent is null
          group by location
          order by sum(new_deaths)/sum(new_cases)*100 desc

     -- 2) LOCATION
 
          select sum(new_deaths)/sum(new_cases)*100 as ChancesOfDeath_IfInfected, LOCATION
          from covidcases
          where continent is not null
          group by location
          order by sum(new_deaths)/sum(new_cases)*100 desc



-- 10th COUNTRY MOST HIT BY COVID

select top 1 location, PopulationInfected 
from (select top 10 max(total_cases) as PopulationInfected, location
from covidcases
where continent is not null
group by location
order by  max(total_cases) desc) as a
order by PopulationInfected asc














select location, date, max(total_cases)/max(population) as PercentPopulationInfected
from covidcases
where continent is not null
group by location, date
order by max(total_cases)/max(population)*100 desc











