select * from LatestInfo;
-- Renaming the column name 
EXEC sp_rename 'LatestInfo.Country_Region','Country','COLUMN';
-- Getting all the Column name and their data type 
Select Column_name, DATA_TYPE
from information_schema.Columns
where table_name = 'LatestInfo';
--EDA analysis of the given data 
-- 1. How many countries are represented in the table  - 187 
select count( distinct Country ) as NumberofCountries
from LatestInfo;
-- 2. What is the total number of confirmed cases across all contries -16480485
select sum(Confirmed )as totalConfirmed
from LatestInfo;
-- 3. Which country has the highest number of confirmed cases  - US 
select Country 
from LatestInfo
order by Confirmed desc ;
-- 4. What is the total number of deaths recorded globally  - 654036
select sum(Deaths) as totalDeaths
from LatestInfo;
-- 5. What is the overall recovery rate (Re covered/Confirmed )across all countries ?- 57 %
select (sum(Recovered)*100/sum(Confirmed)) as overall_recovery_rate
from LatestInfo;
-- 6. which Country has the highest death rate ? - Yemen 
select Country , (Deaths *100 /Confirmed) as death_rate 
from LatestInfo 
order by death_rate desc;
-- 7. What is the total number of active cases globally?- 6358362
select sum(Active)as total_active_cases
from LatestInfo ;
-- 8 . Which country has the highest number of new cases reported ? - US (56336)
select Country , New_cases 
from LatestInfo
order by New_cases desc;
-- 9. What is the distribution of confirmed cases across different WHO regions ?-
select WHO_Region,sum(Confirmed) as total_confirmed
from LatestInfo 
group  by WHO_Region;
-- 10. How many countries reported no new Cases ? -33 
select count(*)as countries_noneCases
from LatestInfo
where New_cases =0;
--11 . Which country saw the largest percentage increase in confirmed Cases over the last week  - US
Select Country 
from LatestInfo 
order by _1_week_change desc ;
-- 12 . Which Country saw the least percentage increase in confirmed cases over the last 1 week period - Jordan
Select Country 
from LatestInfo 
order by _1_week_change  ;
--13. What is the average number of new Deaths per country ? - 28 
select avg(New_Deaths) as average_number_Deaths 
from LatestInfo;
-- 14. Which WHO region has highest average death rate (Deaths/Confirmed )- Eastern Mediterranean and Europe with 3
select * from LatestInfo;
select WHO_Region , avg(Deaths * 100 / Confirmed) as death_rate 
from LatestInfo
group by WHO_Region
order by death_rate desc ;

-- 15 . What is the distribution of confirmed cases , death cases and recoveries by who_region?
SELECT WHO_Region , sum(Confirmed) as total_confirmed , sum(Deaths)as total_deaths , sum(Recovered)as total_recoveries
from LatestInfo
group by WHO_Region;
--16. How has the death rate changed over the past week (_1_week Change)
select WHO_Region, avg(_1_week_change) as avg_death_rate
from LatestInfo
group by WHO_Region;
--17 . Which country has the lowest recovery rate 
select Country , (Recovered*100/Confirmed) as recovery_rate
from LatestInfo
order by recovery_rate asc;
select * from LatestInfo;
