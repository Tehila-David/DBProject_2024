--view #1
CREATE VIEW view_tax_account AS
SELECT 
    p.resident_id as principal_id,
    p.institution_id,
    a1.asset_id,
    a1.asset_address,
    a1.asset_type,
    t.tax_id,
    t.tax_price
FROM ACADEMIC_INSTITUTION a, principal p,ownership o, Asset a1,tax_account t
where a.institutionid=p.institution_id AND p.resident_id = o.resident_id AND o.asset_id = a1.asset_id AND t.tax_id = a1.tax_id

--שליפת נתונים מ VIEW #1
select * from view_tax_account

--Query 1 - A query showing the total property taxes for each manager, sorted from highest to lowest
SELECT 
    principal_id,
    COUNT(DISTINCT asset_id) AS number_of_assets,
    SUM(tax_price) AS total_tax,
    AVG(tax_price) AS average_tax_per_asset
FROM 
    view_tax_account
GROUP BY 
    principal_id
ORDER BY 
    total_tax DESC;
    
    
--Query 2 - A query showing the number of administrators for each educational 
--institution and the property tax price for this institution
SELECT 
    vta.institution_id,
    ai.name,
    ai.address,
    SUM(vta.tax_price) AS tax_price,
    COUNT(DISTINCT vta.principal_id) AS principal_count
FROM 
    view_tax_account vta
JOIN 
    ACADEMIC_INSTITUTION ai ON vta.institution_id = ai.institutionid
GROUP BY 
    vta.institution_id, ai.name, ai.address
ORDER BY 
    principal_count DESC;



--view #2
create VIEW view_Education_Department as
select 
    a.name as academic_institution_name,
    a.kind as academic_institution_kind,
    a.institutionid as academic_institution_id,
    a.numofstudents as num_students,
    a.numofteachers as num_teachers,
    r.resident_fname as principal_fname,
    r.resident_lname as principal_lname,
    r.resident_phone as principal_phone,
    r.resident_birth as principal_birth
from academic_institution a , principal p natural join resident r
where a.institutionid=p.institution_id;

--שליפת נתונים מ VIEW #2
select * from view_Education_Department


--Query 1 - The query shows the older managers who have passed the retirement age and the educational institutions they teach 
select principal_fname,principal_lname,r.resident_address as principal_address,academic_institution_name
from view_Education_Department, principal p natural join resident r 
where academic_institution_id=p.institution_id and
      EXTRACT(YEAR from principal_birth) < 1970 and num_teachers >100 
order by principal_fname;



--Query 2 - The query displays the administrators who are eligible for the budget, meaning they have a high concentration
-- of students and displays the name of the educational institution
select principal_fname,principal_lname,principal_phone,academic_institution_name,academic_institution_kind
from view_Education_Department
where CEIL((num_teachers / num_students) * 100)<5 
order by principal_fname;




