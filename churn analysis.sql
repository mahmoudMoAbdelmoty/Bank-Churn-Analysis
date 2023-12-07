select * from Customer_Churn;

-- count how many customer churned base on churn column
with cte as(
	select churn,
		case 
			when churn=1 then 'Churn'
			else 'Not Churn'
		end as status
	from
		Customer_Churn
)
select
	status,
	COUNT(churn) as cnt
from
	cte
group by status;
-- from 10,000 customer almost 20% of customer churn

-- lets check the type of customer churn status base on Active member
with cte as(
	select 
		churn,
		case 
			when active_member = 1 then 'Active'
			else 'Not Active'
		end as isActiveMember
	from
		Customer_Churn
)
select
	isActiveMember,
	COUNT(case when churn=1 then 1 end) as cnt_churn,
	COUNT(case when churn=0 then 1 end) as cnt_NotChurn
from cte
group by isActiveMember;

-- count total customer that churn base on gender
select
	gender,
	COUNT(case when churn=1 then 1 end) as cnt_churn,
	COUNT(case when churn=0 then 1 end) as cnt_NotChurn,
	COUNT(gender) as total
from
	Customer_Churn
group by gender;

-- count total customer that churn base on active_member and gender
with cte as(
	select
		case 
			when active_member=1 then 'Active'
			else 'Not Active'
		end as isActive,
		active_member,
		gender
	from
		Customer_Churn
	where churn=1
)
select
	*
from
	cte
pivot(
	count(active_member)
	for isActive in([Active], [Not Active]) 
) as pvt;

-- how many customer churn based on demographic
select
	country,
	COUNT(case when churn=1 then 1 end) as cnt_churn,
	COUNT(case when churn=0 then 1 end) as cnt_notChurn,
	count(*) as total_customer
from
	Customer_Churn
group by country;

-- how many customer churn based on age
select
	CASE 
        WHEN age <= 20 THEN 'Group <= 20'
        WHEN age >= 21 AND age <= 40 THEN 'Group 21-40'
        WHEN age >= 41 AND age <= 60 THEN 'Group 41-60'
        ELSE 'Group > 60' 
	END AS age_category,
	COUNT(CASE WHEN churn = 1 then 1 end) as Churn,
    COUNT(CASE WHEN churn = 0 then 1 end) as Not_Churn
from
	Customer_Churn
GROUP BY CASE 
        WHEN age <= 20 THEN 'Group <= 20'
        WHEN age >= 21 AND age <= 40 THEN 'Group 21-40'
        WHEN age >= 41 AND age <= 60 THEN 'Group 41-60'
        ELSE 'Group > 60' 
	END 
order by age_category;

--count total customer that is churn or not based on how long they've been as customer
WITH temp_tenure AS(
    SELECT tenure,
    CASE 
       WHEN churn = 1 THEN 'Churn'
       ELSE 'Not Churn'
    END AS STATUS
    from Customer_Churn
    )
  
SELECT STATUS,
  AVG(tenure*1.0) as Average_tenure
  FROM temp_tenure
GROUP BY STATUS;


-- count how many customer that churn based on the amount of credit score 
-- (average, highest and lowest)
with cte as(
	select
		credit_score,
		case
			when churn=1 then 'Churn'
			else 'Not Churn'
		end as isChurn
	from
		Customer_Churn
)
select
	isChurn,
	AVG(credit_score*1.0) as avg_score,
	MIN(credit_score) as min_score,
	MAX(credit_score) as max_score
from
	cte
group by isChurn;


-- count how many customer that churn based on how many bank product they use
select
	products_number,
	COUNT(case when churn=1 then 1 end) as cnt_churn,
	COUNT(case when churn=0 then 1 end) as cnt_notChurn,
	COUNT(*) as total_customer
from 
	Customer_Churn
group by products_number
order by 1;

-- count how many customer that churn based on credit card ownership
with cte as(
	select
		churn,
		case 
			when credit_card = 1 then 'has credit'
			else 'No credit'
		end as credit_status
	from
		Customer_Churn
)
select
	credit_status,
	COUNT(case when churn=1 then 1 end) as cnt_churn,
	COUNT(case when churn=0 then 1 end) as cnt_notChurn
from
	cte
group by credit_status;


-- count how many customer that churn based on the amount of customer's bank balance
-- (average, highest, lowest)
with cte as(
	select
		balance,
		case 
			when churn=1 then 'Churn'
			else 'Not Churn'
		end as status
	from
		Customer_Churn
)
select
	status,
	AVG(balance) as avg_balance,
	MIN(balance) as min_balance,
	MAX(balance) as max_balance
from
	cte
group by status;

/*
	**	conclusion **

 - Customer in the age category between 41 to 60, are more likely to churn.
 - Customer who has credit card tends to not churn and stay with the bank.
 - Customer who has registerd in more than 1 proudct tends to not churn and stay with the bank. 
*/


