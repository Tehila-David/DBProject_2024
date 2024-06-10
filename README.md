
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
#### תיאור מילולי
האחראי במדור חשבונות באגף שומה וגבייה מעוניין לדעת מהו סוג ההנחה הכי נפוץ בשנים מסוימות.
השאילתה מחזירה את סוג ההנחה הכי נפוץ בכל שנה ( שנים: 2021,2020, 2022, 2023). העמודות המוצגות - סוג הנחה, כמות התושבים שקיבלנו את ההנחה, שנת ההנחה.

#### צילום הרצה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%233_%D7%94%D7%A8%D7%A6%D7%94.png" width="50%">
</p>

#### צילום תוצאה
<p align="middle">
<img src="https://github.com/Tehila-David/DBProject_324926419_324866037/blob/main/Photos/select%233_%D7%AA%D7%95%D7%A6%D7%90%D7%94.png" width="40%">
</p>

### שאילתה מס' 4
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
#### תיאור מילולי
ראש אגף שומה וגבייה מעוניין להעניק הטבות מס או הנחות בארנונה לתושבים ותיקים. לכן הוא מעונין לעדכן את שטחי הנכסים של התושבים שהצטרפו לעיריית ירושלים לפני 5 שנים ורכשו ב 4 שנים האחרונות את הנכס.
שאילתה המעדכנת את השטח של הנכס לפי סוגו, אם הנכס נרכש ב 4 שנים האחרונות ותאריך הצטרפות התושבים בעלי הנכס הוא לפני 5 שנים או יותר.



#### צילום הרצה
<p align="middle">
<img src=" " width="40%">
</p>

#### צילום לפני העדכון
<p align="middle">
<img src=" " width="40%">
</p>


#### צילום אחרי העדכון
<p align="middle">
<img src=" " width="40%">
</p>



### שאילתה מס' 2
#### תיאור מילולי
מדור חובות באגף שומה וגבייה החליטו לעדכן את מחיר החוב לחשבון ארנונה עבור תושבים שתאריך התשלום האחרון של החוב שלהם היה בשנת 2022 ומעלה.
שאילתה המעדכנת את מחיר החוב ב-200% עבור שהתאריך אחרון לתשלום היה בשנת 2022 ומעלה.


#### צילום הרצה
<p align="middle">
<img src=" " width="40%">
</p>


#### צילום לפני העדכון
<p align="middle">
<img src=" " width="40%">
</p>


#### צילום אחרי העדכון
<p align="middle">
<img src=" " width="40%">
</p>

 ## 2 שאילתות delete
 ### שאילתה מס' 1
 #### תיאור מילולי
 מדור חובות באגף שומה וגבייה החליטו למחוק חובות שתאריך התשלום האחרון היה לפני שנת 2010 עבור סוג נכס 'דירה'.
 
 #### צילום הרצה
 <p align="middle">
<img src=" " width="40%">
</p>

 #### צילום לפני המחיקה
 <p align="middle">
<img src=" " width="40%">
</p>

 #### צילום אחרי המחיקה
 <p align="middle">
<img src=" " width="40%">
</p>


 ### שאילתה מס' 2
 #### תיאור מילולי
 מדור חובות באגף שומה וגבייה החליטו למחוק חשבונות ארנונה שנסגרו ללא חובות.
 
 #### צילום הרצה
 <p align="middle">
<img src=" " width="40%">
</p>

 #### צילום לפני המחיקה
 <p align="middle">
<img src=" " width="40%">
</p>

 #### צילום אחרי המחיקה
 <p align="middle">
<img src=" " width="40%">
</p>

## 4 שאילתות select עם פרמטרים
### שאילתה מס' 1
#### תיאור מילולי
מנהל אגף שומה וגבייה מעוניין לדעת איזה תושבים הם בעלי נכס מסוים לפי סוגו ושטחו.
השאילתה מקבלת כפרמטרים את סוג הנכס ושטח הנכס ומחזירה רשימה של פרטים אישיים של תושבים והנכסים שלהם לפי סינון סוג הנכס וגודלו.

#### צילום הרצה
#### צילום תוצאה

### שאילתה מס' 2
#### תיאור מילולי
מנהל מדור חובות מעוניין לדעת על רשימת פרטי חובות עבור סוג נכס מסוים.
השאילתה מקבלת כפרמטרים את סוג הנכס וטווח תאריכים של החוב ומחזירה רשימה של פרטי החוב וגודל הנכס עבור סינון סוג הנכס וטווח תאריכים המתקבלים כפרמטר.

#### צילום הרצה
#### צילום תוצאה

### שאילתה מס' 3
#### תיאור מילולי
#### צילום הרצה
#### צילום תוצאה

### שאילתה מס' 4
#### תיאור מילולי
#### צילום הרצה
#### צילום תוצאה

## 3 אילוצים
### אילוץ מס' 1
#### פקודת alter table
#### הכנסת נתונים אשר סותרים את האילוץ

### אילוץ מס' 2
#### פקודת alter table
#### הכנסת נתונים אשר סותרים את האילוץ

### אילוץ מס' 3
#### פקודת alter table
#### הכנסת נתונים אשר סותרים את האילוץ




