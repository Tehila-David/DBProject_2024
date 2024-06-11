###### SELECT Queries ######

# Querie 1
--The twenty highest debts created in 2017--
select debt_price, asset_type, resident_id, resident_fname
from (
    select debt_id, debt_price, asset_type, asset_id,resident_id, resident_fname
    from Debt d 
    natural join Ownership o 
    natural join Asset a
    natural join Resident r
    where EXTRACT(YEAR from d.debt_create)=2017
    order by debt_price DESC
    
)
where ROWNUM <= 20;



# Querie 2    
-- Calculate the average asset area and tax price for each asset type
select asset_type,
       ROUND(AVG(asset_area), 2) AS avg_area,
       ROUND(AVG(tax_price), 2) AS avg_tax_price
from (
    -- select asset type, asset area, and tax price by joining Asset and Tax_Account tables
    select a.asset_type, a.asset_area, t.tax_price
    from Asset a 
    natural join  Tax_Account t)
group by asset_type
order by asset_type;


# Querie 3
-- Get the discount type with the highest resident count for each year by rank() func
select discount_type, resident_count, discount_year
from (
    -- Calculate the yearly discount types with the highest resident count
    select discount_type,
    EXTRACT(YEAR from discount_start) AS discount_year,
    COUNT(DISTINCT resident_id) AS resident_count,
          RANK() OVER (
               PARTITION BY EXTRACT(YEAR from discount_start) 
               order by COUNT(DISTINCT resident_id) DESC
                       ) AS discount_rank
    from Discount    
    group by discount_type, EXTRACT(YEAR from discount_start)
) 
where discount_rank = 1 --chose the highest--
order by discount_year, resident_count DESC;  



# Querie 4
--  Get the top 10 payment amounts  in 2023 
select tax_id, asset_type, payment_amount
from (
   select tax_id, asset_type, payment_amount
   from Payment p
   natural join Tax_Account t
   natural join Asset a
   where EXTRACT(YEAR from p.payment_date)=2023 
   order by  p.payment_amount DESC)
   where ROWNUM <= 10;
   
   
   
   
###### UPDATE Queries ######  


# Querie 1
-- Update the asset_area based on asset_type for specific assets
update Asset
set asset_area = CASE
    when asset_type = 'Apartment' then 1200
    when asset_type = 'land' then 5000
    when asset_type = 'office' then 3500
    when asset_type = 'Hotel' then 15000    
    else asset_area 
END 
where asset_id in (select asset_id
                   from Asset a 
                   natural join Ownership o
                   natural join Resident r
                   where a.asset_purchase > ADD_MONTHS(SYSDATE, -48)-- Purchased within the last 4 years
                         and r.resident_joining < ADD_MONTHS(SYSDATE, -60));-- Resident joined over 5 years ago


# Querie 2
-- update debt_price by 200% for debts that last_date > 2022
update Debt
set debt_price = debt_price * 2  -- increase by 200%
where debt_id in (
    select debt_id
    from Debt d
    natural join Tax_Account t
    natural join Asset a
    where  EXTRACT(YEAR from d.debt_last_date) > 2022 and  a.asset_type = 'Hotel'
);
   
###### DELETE Queries ######  

#Querie 1
-- delete debts of apartments asset with last date before 2010--
delete from Debt d
where exists (
    select 1
    from Tax_Account t
    natural join Asset a 
    where d.tax_id = t.tax_id
        and a.asset_type = 'Apartment'
           and EXTRACT(YEAR from d.debt_last_date) < 2010
);

#Querie 2
--delete tax_account that closed without debts--

delete from Tax_Account t
where not exists (
    select 1
    from Debt d 
    where d.tax_id = t.tax_id        
        and EXTRACT(YEAR where t.tax_close) < 2020
);
