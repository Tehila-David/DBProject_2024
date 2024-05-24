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
