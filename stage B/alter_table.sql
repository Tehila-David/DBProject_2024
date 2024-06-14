ALTER TABLE asset
ADD bonus NUMBER(20);

UPDATE asset
SET bonus = 5;
