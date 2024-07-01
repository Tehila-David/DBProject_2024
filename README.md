
<h1 align="center">אגף שומא וגביה - עיריית ירושלים</h1>


<p align="middle">
<img src="https://github.com/Tehila-David/database6419_6037/blob/main/Photos/Emblem_of_Jerusalem.svg.png" width="20%">
</p>

**מגישות: תהילה דוד & סיון לוי**

**מערכת: עיריית ירושלים**

**אגף: שומא וגביה**


# מבוא
אגף שומא וגביה הוא הגוף האחראי בעיריית ירושלים על גביית הארנונה ותשלומים עירוניים אחרים מהתושבים והעסקים בעיר. תפקידו המרכזי הוא לקבוע את שיעור הארנונה השנתי על בסיס שטח הנכס, ייעודו וערכו, ולגבות את התשלומים מבעלי הנכסים השונים.

האגף מחולק למספר מחלקות עיקריות:
1. מחלקת שומה - אחראית על חישוב שומות הארנונה לנכסים השונים בעיר על-פי נתוני שטח, ייעוד וערכים עדכניים.
2. מחלקת גבייה - אחראית על הוצאת דרישות תשלום וטיפול בגבייה בפועל של חיובי הארנונה והיטלים מהתושבים והעסקים.
3. מחלקת אכיפה - אחראית על טיפול בחובות ארנונה מפיגורים באמצעים שונים כגון הליכי גבייה, עיקולים וכדומה.

הארגון עוסק בניהול נכסים, חיובי ארנונה ותשלומים של תושבים. הישויות העיקריות הן:
1. נכס - Asset: מייצגת נכס פיזי כגון בניין או קרקע. נכס מאופיין על ידי פרטים כמו כתובת, סוג, שטח וכן מידע על רכישת הנכס כגון תאריך ומחיר.
2. חוב - Debt: מייצגת חוב ארנונה שהתושב חייב לשלם. החוב קשור לנכס ספציפי ומכיל מידע כגון סכום החוב, תאריך יצירת החוב ומחיר/תעריף הארנונה.
3. הנחה - Discount: מייצגת הנחה שניתנת לתושבים על תשלום הארנונה. ההנחה מאופיינת על ידי אחוז ההנחה, סוג ההנחה ותוקף ההנחה. 
4. תושב - Resident: מייצגת תושב המחזיק בנכס ומחויב בתשלום ארנונה. הישות כוללת פרטים אישיים של התושב כגון שם, תאריך לידה, כתובת וכו'.
5. תשלום - Payment: מייצגת תשלום ספציפי שבוצע על ידי התושב. התשלום קשור לחשבון הארנונה של התושב וכולל מידע כמו סכום, תאריך, סוג התשלום וקבלה.
6. חשבון ארנונה - Tax_Account: מייצגת את חשבון הארנונה הכולל של התושב, המשלב את כל החיובים, ההנחות והתשלומים שבוצעו.




<h1 align="right">
ERD Diagram
</h1>  
<img src="https://github.com/Tehila-David/database6419_6037/blob/main/Photos/ERD%20diagram.png" width="98%">

<h1 align="right">
DSD Diagram
</h1>  
<img src="https://github.com/Tehila-David/database6419_6037/blob/main/Photos/DSD%20diagram.png" width="98%">

<h1 align="right">
Oracle DSD Diagram
</h1>  
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/DSD%20Oracle.png" width="98%">

<h1 align="right">
CreateTable Commands
</h1>  

```SQL
CREATE TABLE Resident
(
  resident_id NUMERIC(9) NOT NULL,
  resident_fname VARCHAR(16) NOT NULL,
  resident_lname VARCHAR(16) NOT NULL,
  resident_birth DATE NOT NULL,
  resident_address VARCHAR(30) NOT NULL,
  resident_phone NUMERIC(10) NOT NULL,
  resident_joining DATE NOT NULL,
  PRIMARY KEY (resident_id)
);

CREATE TABLE Tax_Account
(
  tax_id NUMERIC(15) NOT NULL,
  tax_price NUMERIC(15) NOT NULL,
  tax_create DATE NOT NULL,
  tax_close DATE,
  PRIMARY KEY (tax_id)
);

CREATE TABLE Discount
(
  discount_id NUMERIC(15) NOT NULL,
  discount_percent NUMERIC(10) NOT NULL,
  discount_type VARCHAR(80) NOT NULL,
  discount_start DATE NOT NULL,
  discount_end DATE NOT NULL,
  resident_id NUMERIC(9) NOT NULL,
  PRIMARY KEY (discount_id),
  FOREIGN KEY (resident_id) REFERENCES Resident(resident_id)
);

CREATE TABLE debt
(
  debt_id NUMERIC(15) NOT NULL,
  debt_price NUMERIC(15) NOT NULL,
  debt_create DATE NOT NULL,
  debt_last_date DATE NOT NULL,
  tax_id NUMERIC(15) NOT NULL,
  PRIMARY KEY (debt_id, tax_id),
  FOREIGN KEY (tax_id) REFERENCES Tax_Account(tax_id)
);

CREATE TABLE Payment
(
  payment_id NUMERIC(15) NOT NULL,
  payment_amount NUMERIC(15) NOT NULL,
  payment_type VARCHAR(20) NOT NULL,
  payment_date DATE NOT NULL,
  payment_receipt DATE NOT NULL,
  tax_id NUMERIC(15) NOT NULL,
  PRIMARY KEY (payment_id, tax_id),
  FOREIGN KEY (tax_id) REFERENCES Tax_Account(tax_id)
);

CREATE TABLE Asset
(
  asset_id NUMERIC(15) NOT NULL,
  asset_address VARCHAR(30) NOT NULL,
  asset_type VARCHAR(20) NOT NULL,
  asset_area NUMERIC(20) NOT NULL,
  asset_purchase DATE NOT NULL,
  asset_change DATE,
  tax_id NUMERIC(15) NOT NULL,
  PRIMARY KEY (asset_id),
  FOREIGN KEY (tax_id) REFERENCES Tax_Account(tax_id)
);

CREATE TABLE Ownership
(
  asset_id NUMERIC(15) NOT NULL,
  resident_id NUMERIC(9) NOT NULL,
  PRIMARY KEY (asset_id, resident_id),
  FOREIGN KEY (asset_id) REFERENCES Asset(asset_id),
  FOREIGN KEY (resident_id) REFERENCES Resident(resident_id)
);

```

<h1 align="right">
Desc Command
</h1>  
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Desc1.png" width="80%">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Desc2.png" width="80%">

#  שיטות להכנסת נתונים:
##  ייבוא נתונים מקובץ טקסט
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/data_gd.png" width="70%">
</p>


##  ייבוא נתונים מאתר mockaroo
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/mockaroo.png" width="80%">
</p>

##  הכנסת נתונים ע"י Data Generator
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/data_txt.png" width="70%">
</p>

# גיבוי ושחזור נתונים
## גיבוי נתונים
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/backup_24_05_2024.png" width="50%">
</p>

## שחזור נתונים
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/reconstruction.png" width="50%">
</p>

# שאילתות
## 4 שאילתות select
### שאילתה מס' 1
```SQL
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
```
#### תיאור מילולי
ראש אגף שומה וגבייה מעונין לדעת מיהם עשרים התושבים עם החובות הגבוהים ביותר שנוצרו ב 2017 בכדי לעדכן את הסקר השנתי של חשבונות ארנונה באגף.
השאילתה מחזירה את עשרת התושבים עם החובות הכי גבוהים. העמודות המוצגות – סכום החוב, סוג הנכס, ת.ז התושב ושם פרטי של התושב.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%231_%D7%94%D7%A8%D7%A6%D7%94.png" width="50%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%231_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="40%">
</p>

### שאילתה מס' 2

```SQL
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
```
#### תיאור מילולי
האחראי מטעם הסטטיסטיקות בעיריית ירושלים מעונין לדעת את ממוצע מחיר ארנונה עבור סוגי נכסים שונים עבור סקר בנושא חשבונות ארנונה.
השאילתה מחזירה את ממוצע מחיר ארנונה עבור סוגי נכסים שונים. העמודות המוצגות - ממוצע עבור שטח סוג נכס, ממוצע עבור מחיר סוג נכס, סוג נכס.


#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%232_%D7%94%D7%A8%D7%A6%D7%94.png" width="50%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%232_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="40%">
</p>

### שאילתה מס' 3

```SQL
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
```
#### תיאור מילולי
האחראי במדור חשבונות באגף שומה וגבייה מעוניין לדעת מהו סוג ההנחה הכי נפוץ בשנים מסוימות.
השאילתה מחזירה את סוג ההנחה הכי נפוץ בכל שנה ( שנים: 2012 - 2017). העמודות המוצגות - סוג הנחה, כמות התושבים שקיבלנו את ההנחה, שנת ההנחה.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%233_%D7%94%D7%A8%D7%A6%D7%94.png" width="50%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%233_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="40%">
</p>

### שאילתה מס' 4

```SQL
select tax_id, asset_type, payment_amount
from (
   select tax_id, asset_type, payment_amount
   from Payment p
   natural join Tax_Account t
   natural join Asset a
   where EXTRACT(YEAR from p.payment_date)=2023 
   order by  p.payment_amount DESC)
   where ROWNUM <= 10;
   
```
#### תיאור מילולי
הלשכה המרכזית לסטטיסטיקה עורכת מידי שנה סקר לאיזה סוג נכס מחיר הארנונה הכי גבוה.
שאילתה המחזירה עשרת תשלומי ארנונה הכי גבוהים לסוג הנכס. העמודות המוצגות - מזהה חשבון ארנונה, סוג נכס, מחיר תשלום.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%234_%D7%94%D7%A8%D7%A6%D7%94.png" width="50%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%234_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="40%">
</p>

## 2 שאילתות update
### שאילתה מס' 1

```SQL
update Asset
set bonus = CASE
    when asset_type = 'Apartment' then 20
    when asset_type = 'land' then 15
    when asset_type = 'office' then 30
    when asset_type = 'Hotel' then 25    
    else bonus 
END 
where asset_id in (select asset_id
                   from Asset a 
                   natural join Ownership o
                   natural join Resident r
                   where a.asset_purchase > ADD_MONTHS(SYSDATE, -48)-- Purchased within the last 4 years
                         and r.resident_joining < ADD_MONTHS(SYSDATE, -60));-- Resident joined over 5 years ago

```
#### תיאור מילולי
ראש אגף שומה וגבייה מעוניין להעניק הטבות מס או הנחות בארנונה לתושבים ותיקים. לכן הוא מעונין לעדכן את הבונוס (אחוז החזר כספי עבור סוג נכס) של התושבים שהצטרפו לעיריית ירושלים לפני 5 שנים ורכשו ב 4 שנים האחרונות את הנכס.
שאילתה המעדכנת את הבונוס של הנכס לפי סוגו, אם הנכס נרכש ב 4 שנים האחרונות ותאריך הצטרפות התושבים בעלי הנכס הוא לפני 5 שנים או יותר.



#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Update%231_%D7%94%D7%A8%D7%A6%D7%94.png" width="80%">
</p>

#### צילום לפני העדכון
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Update%231_before.png" width="70%">
</p>


#### צילום אחרי העדכון
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Update%231_after.png" width="70%">
</p>



### שאילתה מס' 2

```SQL
update Debt
set debt_price = debt_price * 2  -- increase by 200%
where debt_id in (
    select debt_id
    from Debt d
    natural join Tax_Account t
    natural join Asset a
    where  EXTRACT(YEAR from d.debt_last_date) > 2022 and  a.asset_type = 'Hotel'
);
```
#### תיאור מילולי
מדור חובות באגף שומה וגבייה החליטו לעדכן את מחיר החוב לחשבון ארנונה עבור תושבים שתאריך התשלום האחרון של החוב שלהם היה בשנת 2022 ומעלה.
שאילתה המעדכנת את מחיר החוב ב-200% עבור חובות שהתאריך אחרון לתשלום היה בשנת 2022 ומעלה.


#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Update%232_%D7%94%D7%A8%D7%A6%D7%94.png" width="80%">
</p>


#### צילום לפני העדכון
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Update%232_before.png" width="70%">
</p>


#### צילום אחרי העדכון
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Update%232_after.png" width="70%">
</p>

 ## 2 שאילתות delete
 ### שאילתה מס' 1
 
```SQL
delete from Debt d
where exists (
    select 1
    from Tax_Account 
    natural join Asset 
    where d.tax_id = tax_id
        and asset_type = 'Apartment'
           and EXTRACT(YEAR from d.debt_last_date) < 2011
);
```
 #### תיאור מילולי
 מדור חובות באגף שומה וגבייה החליטו למחוק חובות שתאריך התשלום האחרון היה לפני שנת 2011 עבור סוג נכס 'דירה'.
 
 #### צילום הרצה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Delete%231_%D7%94%D7%A8%D7%A6%D7%94.png" width="80%">
</p>

 #### צילום לפני המחיקה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Delete%231_before.png" width="70%">
</p>

 #### צילום אחרי המחיקה
 ניתן לראות לאחר הרצה של select שלא קיימות רשומות מסוג זה.
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Delete%231_after!.png" width="70%">
</p>


 ### שאילתה מס' 2
  
```SQL
delete from Discount d1
where d1.discount_id  in (
    select d.discount_id
    from Discount d
    where d.discount_type ='MilitaryService' and  EXTRACT(YEAR from d.discount_end) < 2022 )
    
```
 #### תיאור מילולי
 האחראי לגבי הנחות לחשבונות ארנונה החליט למחוק את כל ההנחות שהסתיימו לפני שנת 2022 ושסוג ההנחה שווה ל – MilitaryService (שירות צבאי).
 
 #### צילום הרצה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Delete%232_%D7%94%D7%A8%D7%A6%D7%94.png" width="80%">
</p>

 #### צילום לפני המחיקה

 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Delete%232_before.png" width="70%">
</p>

 #### צילום אחרי המחיקה
 ניתן לראות לאחר הרצה של select שלא קיימות רשומות מסוג זה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/Delete%232_after.png" width="70%">
</p>

# שאילתות עם פרמטרים
### שאילתה מס' 1
 
```SQL
select resident_fname, resident_lname, resident_phone, asset_type, asset_area
from asset
natural join ownership
natural join resident
where asset_type = &<name="asset_type" list="Hotel,office,land,Apartment" type="string" required= "true" >
                   and asset_area >= &<name="minimum_area" type="integer"  required= "true">
order by asset_purchase DESC
```
#### תיאור מילולי
מנהל אגף שומה וגבייה מעוניין לדעת איזה תושבים הם בעלי נכס מסוים לפי סוגו ושטחו.
השאילתה מקבלת כפרמטרים את סוג הנכס ושטח הנכס ומחזירה רשימה של פרטים אישיים של תושבים והנכסים שלהם לפי סינון סוג הנכס וגודלו.

#### צילום הרצה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%231_%D7%94%D7%A8%D7%A6%D7%94.png" width="85%">
</p>

#### צילום תוצאה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%231_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="60%">
</p>


### שאילתה מס' 2
 
```SQL
select debt_id, asset_type, asset_area,debt_price, debt_last_date  
from asset
natural join tax_account
natural join debt 
where asset_type = &<name="asset_type" list="Hotel,office,land,Apartment" type="string" required= "true" > 
     and debt_last_date between 
                            &<name=d_from type="date" required= "true"> and &<name=d_to type="date" required= "true">
order by debt_last_date DESC
```
#### תיאור מילולי
מנהל מדור חובות מעוניין לדעת על רשימת פרטי חובות עבור סוג נכס מסוים.
השאילתה מקבלת כפרמטרים את סוג הנכס וטווח תאריכים של החוב ומחזירה רשימה של פרטי החוב וגודל הנכס עבור סינון סוג הנכס וטווח תאריכים המתקבלים כפרמטר.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%232_%D7%94%D7%A8%D7%A6%D7%94.png" width="85%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%232_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="60%">
</p>


### שאילתה מס' 3
 
```SQL
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

```
#### תיאור מילולי
מנהל מדור הנחות מעונין לדעת כמה אחוזי הנחה מקבלים לסוג הנחה מסוים.
השאילתה מקבלת כפרמטרים את סוג ההנחה ומינימום אחוזי ההנחה. ומחזירה את שמות התושבים וסוג הנכס שקיבלו עליו אחוזי הנחה יותר מהמינימום שהתקבל לסוג ההנחה הנבחר. ממוין בסדר עולה לפי אחוזי ההנחה.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%233_%D7%94%D7%A8%D7%A6%D7%94.PNG" width="85%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%233_%D7%AA%D7%95%D7%A6%D7%90%D7%94.PNG" width="60%">
</p>


### שאילתה מס' 4
 
```SQL
SELECT resident_fname, payment_type, payment_amount, payment_date,asset_type, tax_id
FROM Tax_account 
natural join Payment
natural join Asset
natural join Ownership
natural join Resident
WHERE payment_type = &<name = "type of payment" type = "string" list="Credit,Cash,Check" required = "true">
      AND asset_type = &<name = "type of asset" type = "string" list="Hotel,office,land,Apartment" required = "true">       
ORDER BY payment_amount DESC

```
#### תיאור מילולי
מדור חשבונות מעוניינים לעשות סקר על סוגי אמצעי תשלום על חשבונות ארנונה. 
שאילתה המקבלת כפרמטרים את סוג הנכס ואת אמצעי התשלום. מחזירה את שם התושב ששילם באמצעי תשלום שנבחר, הסכום ששולם, תאריך ביצוע התשלום, מספר חשבון ארנונה עבורו שילם התושב ואת סוג הנכס הנבחר. ממוין בסדר יורד לפי סכום התשלום.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%234_%D7%94%D7%A8%D7%A6%D7%94.PNG" width="85%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/paramSelect%234_%D7%AA%D7%95%D7%A6%D7%90%D7%94.PNG" width="60%">
</p>


# אילוצים
### אילוץ מס' 1
#### תיאור האילוץ
בטבלת Payment בשדה payment_type הערך ברירת מחדל הוא "credit".

#### פקודת DEFAULT - alter table 
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/constraint1%20-%20default%20-%20code%20.png" width="40%">
</p>

#### הכנסת נתונים אשר מוכיחים את קיום האילוץ
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/constraint1%20-%20default.png" width="95%">
</p>


### אילוץ מס' 2
#### תיאור האילוץ
בטבלת Discount תאריך סיום ההנחה יותר מאוחר מתאריך תחילת תוקף ההנחה
#### פקודת CHECK - alter table 
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/constraint2%20-code%40.png" width="40%">
</p>

#### הכנסת נתונים אשר סותרים את האילוץ
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/constraint2%20-error%40.png" width="85%">
</p>


### אילוץ מס' 3
#### תיאור האילוץ
בטבלת Tax_account שדה tax_price חייב להכיל ערך (שאינו NULL)
#### פקודת NOT NULL - alter table  
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/constraint3%20-code%20-%20null.png" width="35%">
</p>

#### הכנסת נתונים אשר סותרים את האילוץ
 
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/constraint3%20-error-%20null.png" width="80%">
</p>

# פונקציות 
### פונקציה מס' 1 - calculate_monthly_tax
```SQL
CREATE OR REPLACE FUNCTION calculate_monthly_tax(p_asset_id IN asset.asset_id%TYPE)
RETURN NUMBER IS
    v_annual_tax NUMBER := 0;
    v_asset_area asset.asset_area%TYPE;
    v_asset_type asset.asset_type%TYPE;
    v_tax_rate NUMBER;
    v_discount_percent discount.discount_percent%TYPE := 0;
    Asset_not_found EXCEPTION;
    
    -- Cursor to fetch asset details
    CURSOR c_asset IS
        SELECT asset_area, asset_type
        FROM Asset
        WHERE asset_id = p_asset_id;
        
    -- Cursor to fetch discount information for the asset
    CURSOR c_discount IS
        SELECT discount_percent
        FROM Discount 
        NATURAL JOIN Resident 
        NATURAL JOIN Ownership 
        WHERE asset_id = p_asset_id;
       
BEGIN
    -- Fetch asset details
    OPEN c_asset;
    FETCH c_asset INTO v_asset_area, v_asset_type;
  
    -- Check if asset exists
    IF c_asset%NOTFOUND THEN
        CLOSE c_asset;
        RAISE Asset_not_found;
    END IF;
    CLOSE c_asset;
    
    -- Determine tax rate based on asset type
    CASE v_asset_type
        WHEN 'Hotel' THEN v_tax_rate := 0.50;
        WHEN 'office' THEN v_tax_rate := 0.40;
        WHEN 'land' THEN v_tax_rate := 0.30;
        WHEN 'Apartment' THEN v_tax_rate := 2;
        ELSE v_tax_rate := 0.20;
    END CASE;
    
    -- Calculate base tax
    v_annual_tax := v_asset_area * v_tax_rate;
    
    -- Apply discount if any
    OPEN c_discount;
    FETCH c_discount INTO v_discount_percent;
    CLOSE c_discount;
    
    -- Apply discount to the tax amount
    IF v_discount_percent > 0 THEN
        v_annual_tax := v_annual_tax * (1 - v_discount_percent / 100);
    END IF;
  
    -- Output the final tax amount
    DBMS_OUTPUT.PUT_LINE('The final tax amount is ' || v_annual_tax);
    RETURN v_annual_tax;
   
EXCEPTION
    -- Handle case when asset is not found
    WHEN Asset_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: Asset not found');
END;
```
#### תיאור הפונקציה
פונקציה המקבלת מזהה נכס ומחשבת את המס עבור הנכס בהתבסס על השטח, הסוג שלו וכל ההנחות שהוא קיבל עבור נכס זה. אם מספר הנכס שהתקבל כפרמטר לפונקציה אינו קיים בטבלה של Asset הפונקציה זורקת חריגה שהנכס לא נמצא. ומחזירה את הסכום הסופי לתשלום.
##### אחרי הרצת הפונקציה עבור asset_id:6374423052
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%95%D7%A0%D7%A7%D7%A6%D7%99%D7%94%231%20-%20%D7%AA%D7%95%D7%A6%D7%90%D7%94.PNG" width="60%">
</p>

##### output:
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%95%D7%A0%D7%A7%D7%A6%D7%99%D7%94%231%20-%20output.PNG" width="60%">
</p>

### פונקציה מס' 2 - get_resident_debt_history
```SQL
```
#### תיאור הפונקציה
פונקציה המקבלת מזהה תושב ומחזירה את היסטורית החובות עבור תושב זה. אם לא קיימים חובות עבור תושב זה אז תיזרק חריגה שלא קיימים חובות. 
##### אחרי הרצת הפונקציה עבור resident_id: 258439593


<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%95%D7%A0%D7%A7%D7%A6%D7%99%D7%94%232%20-%20output.PNG" width="80%">
</p>


# פרוצדורות 
### פרוצדורה מס' 1 - update_tax_price
```SQL
```
#### תיאור הפרוצדורה
מקבלת מזהה חשבון, סכום הארנונה התקופתי (מקבלת מהפונקציה) ומעדכנת את tax_price ביישות חשבון ארנונה ומוסיפה רשומה חדשה לdebt.
##### לפני הרצת הפרוצדורה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%A8%D7%95%D7%A6%D7%93%D7%95%D7%A8%D7%94%231%20-%20%D7%97%D7%A9%D7%91%D7%95%D7%9F%20%D7%90%D7%A8%D7%A0%D7%95%D7%A0%D7%94%20%D7%9C%D7%A4%D7%A0%D7%99.PNG " width="60%">
</p>

##### אחרי הרצת הפרוצדורה
##### UPDATE TAX_ACCOUNT
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%A8%D7%95%D7%A6%D7%93%D7%95%D7%A8%D7%94%231%20-%20%D7%97%D7%A9%D7%91%D7%95%D7%9F%20%D7%90%D7%A8%D7%A0%D7%95%D7%A0%D7%94%20%D7%90%D7%97%D7%A8%D7%99.PNG " width="60%">
</p>

##### ADD DEBT
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%A8%D7%95%D7%A6%D7%93%D7%95%D7%A8%D7%94%231%20-%20%D7%94%D7%95%D7%A1%D7%A4%D7%AA%20%D7%97%D7%95%D7%91%20%D7%97%D7%93%D7%A9.PNG" width="60%">
</p>

### פרוצדורה מס' 2 - pay_debt
```SQL
```
#### תיאור הפרוצדורה
פרוצדורה המקבלת מזהה חוב debt_id ומוסיפה לטבלת PAYMENT רשומה חדשה עם סכום החוב ומוחקת מטבלת DEBT את הרשומה עם המזהה debt_id
##### לפני הרצת הפרוצדורה
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%A8%D7%95%D7%A6%D7%93%D7%95%D7%A8%D7%94%232%20before%20delete%20debt.png" width="80%">
</p>

##### אחרי הרצת הפרוצדורה 

##### DELETE DEBT
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%A8%D7%95%D7%A6%D7%93%D7%95%D7%A8%D7%94%232%20-%20delete%20debt.PNG" width="80%">
</p>

##### ADD PAYMENT
 <p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/%D7%A4%D7%A8%D7%95%D7%A6%D7%93%D7%95%D7%A8%D7%94%232%20-%20add%20payment.PNG" width="80%">
</p>

# תוכניות
### תוכנית מס' 1
```SQL
```
#### תיאור התוכנית
תוכנית המעדכנת חשבונות ארנונה כל תקופה (חודשיים).
הפעלת פונקציה 1 - calculate_ monthly_tax - מקבלת כפרמטר מזהה נכס רנדומלי.
הפעלת פרוצדורה 1 - update_tax_price - מקבלת מזהה חשבון ארנונה וסכום המס (שחזר מהפונקציה).
הדפסה של סכום המס שהתושב צריך לשלם ומזהה החוב החדש ועדכון tax_price.
##### Output
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/program%231_output.PNG" width="60%">
</p>


### תוכנית מס' 2
```SQL
```
#### תיאור התוכנית
תוכנית המבצעת תשלום חוב לתושב מסוים.
הפעלת פונקציה 2 - get_resident_debt_history - מקבלת כפרמטר מזהה תושב רנדומלי.
הפעלת פרוצדורה 2 - pay_debt - מקבלת מזהה חוב (אם קיימים מספר חובות אז משלמים את החוב האחרון).
הדפסת מזהה התושב, מזהה החוב שנמחק ומזהה תשלום חדש.
##### Output
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/program%232_output.PNG" width="60%">
</p>











