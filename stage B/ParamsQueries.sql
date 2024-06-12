####ParamsQueries####

#Querie 1
--The query accepts as parameters the type of property and the area of ​​the property and returns
--a list of personal details of residents and their properties filtered by property type and size.
select resident_fname, resident_lname, resident_phone, asset_type, asset_area
from asset
natural join ownership
natural join resident
where asset_type = &<name="asset_type" list="Hotel,office,land,Apartment" type="string" required= "true" >
                   and asset_area >= &<name="minimum_area" type="integer"  required= "true">
order by asset_purchase DESC


#Querie 2
--The query accepts as parameters the asset type and date range of the debt and returns 
--a list of the debt details and the size of the asset for
--filtering the asset type and date range received as a parameter.
select debt_id, asset_type, asset_area,debt_price, debt_last_date  
from asset
natural join tax_account
natural join debt 
where asset_type = &<name="asset_type" list="Hotel,office,land,Apartment" type="string" required= "true" > 
     and debt_last_date between 
                            &<name=d_from type="date" required= "true"> and &<name=d_to type="date" required= "true">
order by debt_last_date DESC



#Querie 3
--The query accepts as parameters the type of discount and the minimum percentage of the discount.
--and returns the names of the residents and the type of property that received a discount
--percentage greater than the minimum received for the selected discount type.
--Sorted in ascending order by discount percentage.
SELECT resident_fname, discount_type, discount_percent, asset_type
FROM Resident 
natural join Discount
natural join Ownership
natural join asset
WHERE discount_type = &<name = "type discount" type = "string" hint= "Enter type of discount" 
       list = "disability,MilitaryService,lowIncome,NationalService,widow/er,singleParent" required = "true">
       and discount_percent >= &<name="minimum_percent" type="integer" hint= "Enter minimum  of percents discount"
           required= "true">            
GROUP BY discount_type, discount_percent, resident_fname, asset_type
ORDER BY discount_percent 



#Querie 4
--A query that accepts as parameters the property type and the payment method.
--Returns the name of the resident who paid with the selected payment method, the amount paid,
--the date the payment was made and the property tax account number for which the resident paid.
--Sorted in descending order by payment amount.
SELECT resident_fname, payment_type, payment_amount, payment_date,asset_type, tax_id
FROM Tax_account 
natural join Payment
natural join Asset
natural join Ownership
natural join Resident
WHERE payment_type = &<name = "type of payment" type = "string" list="Credit,Cash,Check" required = "true">
      AND asset_type = &<name = "type of asset" type = "string" list="Hotel,office,land,Apartment" required = "true">       
ORDER BY payment_amount DESC












