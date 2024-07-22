
--Adding the records from the TEACHER entity to the resident entity
INSERT INTO Resident (Resident_ID, resident_fname, resident_lname, resident_birth, resident_address, resident_phone, resident_joining)
SELECT t.id, t.firstname, t.lastname,
       to_date('01-01-1970','dd-mm,yyyy') AS resident_birth,
       'Unknown Address' AS resident_address,
       t.phone,
       TRUNC(SYSDATE) AS resident_joining
FROM Teacher t;

commit;

--In a teacher entity, changing the ID field to be a foreign key from a resident table
alter table TEACHER 
add foreign key (iD)
references RESIDENT (Resident_ID);


--In the TEACHER entity we removed the fields FirstName, LastName.
ALTER TABLE TEACHER DROP COLUMN FirstName;
ALTER TABLE TEACHER DROP COLUMN LastName;



--Creating a Principal table
CREATE TABLE Principal (
    Principal_id NUMBER PRIMARY KEY,
    Resident_ID NUMBER,
    Institution_ID NUMBER,
    FOREIGN KEY (Resident_ID) REFERENCES Resident(Resident_ID),
    FOREIGN KEY (Institution_ID) REFERENCES ACADEMIC_INSTITUTION(InstitutionID)
);


--Adding records to discount entity for teachers
INSERT INTO Discount (Discount_ID, Discount_percent, Discount_type, Discount_start, Discount_end, resident_id)
SELECT discountIDFunc, 30, 'Teacher', TRUNC(SYSDATE),ADD_MONTHS(TRUNC(SYSDATE), 24),t.id
FROM Teacher t;



--Adding PRINCIPAL
INSERT INTO PRINCIPAL (Resident_ID, Institution_ID)
SELECT r.resident_id, a.institutionid
FROM resident r, ACADEMIC_INSTITUTION a
where r.resident_id BETWEEN 1000000 AND 9999999;

--Adding discounts for teachers
INSERT INTO Discount (Discount_ID, Discount_percent,Discount_Type,Discount_Start,Discount_End,Resident_Id)
SELECT t.id+100, 40, 'teacher',  TRUNC(SYSDATE),ADD_MONTHS(TRUNC(SYSDATE), 24),t.id
FROM Teacher t;





