use nishit

select *
from expenses2021;

/*
BELOW GIVEN QUERIES WERE USED FOR TABLEAU
*/


-- GETS TOTAL AMOUNT SPENT PER PURPOSE

select purpose, sum(amount) as TotalSpent
from expenses2021
group by purpose
order by sum(amount) desc ;


-- GETS AMOUNT SPENT ON DIFFERENT REASONS AND THEIR PURPOSE

select reason, purpose, sum(amount) as TotalSpent, count(*) as NoOfTransactions
from expenses2021
group by reason, purpose
order by sum(amount) desc;


-- GETS THE REASON FOR WHICH MAXIMUM AMOUNT WAS SPENT

select reason, purpose, amount as MaxAmount
from expenses2021
where amount in (select max(amount) from expenses2021);


-- GETS THE REASON FOR WHICH MINIMUM AMOUNT WAS SPENT

select reason, purpose, amount as MinAmount
from expenses2021
where amount in (select , min(amount) from expenses2021);


--GETS TOP 5 MAXIMUM EXPENSES

select top 5 amount as Top5Amount, purpose, reason
from expenses2021
order by amount desc;


-- GETS 10th MAXIMUM EXPENSE

select top 1 amount as Top10Expense, purpose, reason
from (select top 10 amount, Purpose, reason 
from expenses2021
order by amount desc) as a 
order by amount asc;


-- GETS PERCENTAGE OF TOTAL AMOUNT SPENT PER PURPOSE

select purpose, sum(amount)/25990*100 as TotalPercentSpent
from expenses2021
group by purpose
order by sum(amount)/25990*100 desc;










/*
BELOW GIVEN QUERIES WERE NOT USED FOR TABLEAU
*/



select sum(amount) as TotalAmountSpent
from expenses2021;

select max(amount) as MaxSpent, min(amount) as MinSpent, avg(amount) as AvgSpent
from expenses2021;

select reason, purpose, amount as MaxAmount
from expenses2021
where amount in (select min(amount) from expenses2021);

select purpose, reason, amount 
from expenses2021
where amount in (select max(amount) from expenses2021);
------------------------------------------------------------------------------------------------------------------------------------------

select sum(amount), sum(amount)/12 as AvgPerMonth
from expenses2021
where reason = 'food';

select max(amount) as MaxSpent, min(amount) as MinSpent, avg(amount) as AvgSpent,count(*) as NoOfTransactions, sum(amount) as TotalSpent
from expenses2021
where reason = 'food';

select count(*)
from expenses2021
where reason = 'food';

select reason, count(*) as TotalTransacions, sum(amount) as TotalSpent, avg(amount) as AverageSpent
from expenses2021
where reason = 'food'
group by reason;

--------------------------------------------------------------------------------------------------------------------------------------------------

select distinct(purpose)
from expenses2021;


select distinct(reason)
from expenses2021
where purpose = 'wants';

select distinct(reason)
from expenses2021
where purpose = 'needs';

select distinct(reason) 
from expenses2021
where purpose = 'miscellaneous';

select purpose ,sum(amount) as TotalSpent 
from expenses2021
group by purpose;

select sum(amount)
from expenses2021;

select sum(amount)/25990*100 as TotalPercentSpent, purpose
from expenses2021
group by purpose;

select purpose, sum(amount) as TotalSpent, count(*) as TotalTransactions, sum(amount)/count(*) as AvgAmountPerTransaction, sum(amount)/25990*100 as TotalPercentSpent
from expenses2021 
group by purpose
order by sum(amount) desc ;

select purpose, sum(amount)/25990*100 as TotalPercentSpent
from expenses2021
group by purpose
order by sum(amount)/25990*100 desc;


---------------------------------------------------------------------------------------------------------------------------------------
--to change data type of a column
alter table expenses2021
alter column amount float;
---------------------------------------------------------------------------------------------------------------------------------------

select reason, count(*) as TotalTransactions, sum(amount) as TotalSpent
from expenses2021
group by reason
order by count(*) desc;

select reason, sum(amount) as TotalSpent
from expenses2021
group by reason
order by sum(amount) desc;

select purpose, sum(amount) as TotalSpent
from expenses2021
group by purpose
order by sum(amount) desc;


select top 5 amount, reason,purpose
from expenses2021
order by amount desc;


----------------------------------------------------------------------------------------------------------------------------------------
--to change -ve values to +ve values
update expenses2021 
set amount = (amount)*(-1);
----------------------------------------------------------------------------------------------------------------------------------------
select * from expenses2021
order by 1 desc;
----------------------------------------------------------------------------------------------------------------------------------------
select top 5 amount, reason
from expenses2021
where purpose = 'miscellaneous'
order by amount desc;

select top 5 amount, reason
from expenses2021
where purpose = 'wants'
order by amount desc;

select top 5 amount, reason
from expenses2021
where purpose = 'needs'
order by amount desc;
-----------------------------------------------------------------------------------------------------------------------------------------

SELECT * 
FROM expenses2021
order by amount desc;



--to find the reason and purpose for the highest amount 

select reason, purpose, amount as MaxAmount
from expenses2021
where amount in (select max(amount) from expenses2021);


--to find the reason and purpose for the lowest amount 

select reason, purpose, amount as MaxAmount
from expenses2021
where amount in (select min(amount) from expenses2021);




































