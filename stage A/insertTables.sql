insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (817886464, 'Bette', 'Gano', to_date('25-12-1981', 'dd-mm-yyyy'), '53 Fierstein Ave', 526347687, to_date('15-04-2013', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (125112756, 'Nile', 'Domino', to_date('15-03-1993', 'dd-mm-yyyy'), '53rd Street', 525177050, to_date('13-03-2001', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (186491592, 'Isaac', 'Underwood', to_date('03-10-1983', 'dd-mm-yyyy'), '81 Goldberg', 520102829, to_date('13-01-2012', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (889391322, 'Rodney', 'Deejay', to_date('28-12-1983', 'dd-mm-yyyy'), '41 Whitaker Drive', 505240709, to_date('16-12-2020', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (475778693, 'Sheryl', 'Griffith', to_date('03-09-1999', 'dd-mm-yyyy'), '54 Edmonton', 547499058, to_date('06-05-2008', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (898892515, 'Vendetta', 'Soda', to_date('06-02-1995', 'dd-mm-yyyy'), '2 Stockard Road', 525173508, to_date('03-06-2008', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (324635689, 'Antonio', 'Oates', to_date('28-03-1991', 'dd-mm-yyyy'), '71 Chapeco', 524596813, to_date('10-11-2008', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (341694642, 'Brendan', 'Sawa', to_date('25-03-1995', 'dd-mm-yyyy'), '85 Gennevilliers Street', 500873860, to_date('08-03-2006', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (218269357, 'Emmylou', 'Sartain', to_date('17-03-1988', 'dd-mm-yyyy'), '34 Coley Road', 524138297, to_date('23-04-2021', 'dd-mm-yyyy'));

insert into SIVAN.RESIDENT (RESIDENT_ID, RESIDENT_FNAME, RESIDENT_LNAME, RESIDENT_BIRTH, RESIDENT_ADDRESS, RESIDENT_PHONE, RESIDENT_JOINING)
values (784239577, 'Vivica', 'Warwick', to_date('04-02-1983', 'dd-mm-yyyy'), '136 Polley Drive', 524336528, to_date('20-03-2003', 'dd-mm-yyyy'));

commit;

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (55339, 97, 'disability', to_date('24-08-2001', 'dd-mm-yyyy'), to_date('18-05-2005', 'dd-mm-yyyy'), 422522771);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (42488, 18, 'singleParent', to_date('19-09-2000', 'dd-mm-yyyy'), to_date('03-12-2007', 'dd-mm-yyyy'), 958839685);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (33578, 57, 'widow/er', to_date('18-01-2004', 'dd-mm-yyyy'), to_date('10-06-2005', 'dd-mm-yyyy'), 249277281);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (63793, 61, 'MilitaryService', to_date('31-05-2003', 'dd-mm-yyyy'), to_date('28-03-2005', 'dd-mm-yyyy'), 613385368);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (89729, 45, 'MilitaryService', to_date('08-08-2002', 'dd-mm-yyyy'), to_date('08-05-2006', 'dd-mm-yyyy'), 781714948);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (93747, 32, 'singleParent', to_date('08-04-2003', 'dd-mm-yyyy'), to_date('09-08-2006', 'dd-mm-yyyy'), 119289287);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (46727, 39, 'disability', to_date('09-07-2001', 'dd-mm-yyyy'), to_date('05-07-2006', 'dd-mm-yyyy'), 189527387);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (38562, 56, 'lowIncome', to_date('18-04-2002', 'dd-mm-yyyy'), to_date('30-05-2007', 'dd-mm-yyyy'), 963512184);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (31837, 93, 'NationalService', to_date('02-01-2004', 'dd-mm-yyyy'), to_date('28-01-2005', 'dd-mm-yyyy'), 159531378);

insert into SIVAN.DISCOUNT (DISCOUNT_ID, DISCOUNT_PERCENT, DISCOUNT_TYPE, DISCOUNT_START, DISCOUNT_END, RESIDENT_ID)
values (75282, 12, 'NationalService', to_date('07-08-2000', 'dd-mm-yyyy'), to_date('12-10-2006', 'dd-mm-yyyy'), 352164395);

commit;

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (8872278337, 439.00, to_date('13-10-2014', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (9663324157, 20.00, to_date('16-11-2014', 'dd-mm-yyyy'), to_date('11-06-2022', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (3885561779, 149.00, to_date('26-07-2012', 'dd-mm-yyyy'), to_date('10-04-2018', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (4767223697, 249.00, to_date('18-01-2017', 'dd-mm-yyyy'), to_date('22-09-2019', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (5617554972, 28.00, to_date('13-07-2010', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (5524657378, 35.00, to_date('18-07-2012', 'dd-mm-yyyy'), to_date('26-02-2022', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (4257754546, 149.00, to_date('29-12-2015', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (7853432813, 169.00, to_date('21-02-2016', 'dd-mm-yyyy'), to_date('31-12-2020', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (1283916818, 117.00, to_date('19-06-2011', 'dd-mm-yyyy'), to_date('04-04-2018', 'dd-mm-yyyy'));

insert into SIVAN.TAX_ACCOUNT (TAX_ID, TAX_PRICE, TAX_CREATE, TAX_CLOSE)
values (2753328159, 179.00, to_date('10-08-2012', 'dd-mm-yyyy'), to_date('20-11-2019', 'dd-mm-yyyy'));

commit;

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (9948879568, 2440, 'Credit', to_date('21-03-2018', 'dd-mm-yyyy'), to_date('03-02-2019', 'dd-mm-yyyy'), 2989134417);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (1118398797, 3744, 'Credit', to_date('19-11-2019', 'dd-mm-yyyy'), to_date('11-04-2020', 'dd-mm-yyyy'), 8613172535);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (2188219423, 2896, 'Cash', to_date('11-09-2015', 'dd-mm-yyyy'), to_date('24-09-2016', 'dd-mm-yyyy'), 7589546594);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (8723854491, 4754, 'Credit', to_date('04-05-2016', 'dd-mm-yyyy'), to_date('23-01-2021', 'dd-mm-yyyy'), 6371867477);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (4476346898, 2926, 'Cash', to_date('29-11-2015', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), 9643948722);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (4368336566, 643, 'Credit', to_date('01-08-2015', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 6371867477);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (7136171599, 5906, 'Cash', to_date('27-05-2021', 'dd-mm-yyyy'), to_date('19-07-2020', 'dd-mm-yyyy'), 7214938872);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (4183157562, 3385, 'Check', to_date('16-09-2019', 'dd-mm-yyyy'), to_date('01-01-2016', 'dd-mm-yyyy'), 3236776286);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (6684276995, 5917, 'Credit', to_date('17-09-2021', 'dd-mm-yyyy'), to_date('18-01-2018', 'dd-mm-yyyy'), 1142896819);

insert into SIVAN.PAYMENT (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_TYPE, PAYMENT_DATE, PAYMENT_RECEIPT, TAX_ID)
values (7721387467, 3770, 'Credit', to_date('29-05-2022', 'dd-mm-yyyy'), to_date('16-04-2016', 'dd-mm-yyyy'), 9214671395);

commit;

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (6686887486, 499.00, to_date('09-11-2019', 'dd-mm-yyyy'), to_date('25-07-2021', 'dd-mm-yyyy'), 5855814678);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (6467125237, 39.00, to_date('22-02-2019', 'dd-mm-yyyy'), to_date('21-04-2011', 'dd-mm-yyyy'), 4185733533);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (9921256963, 189.00, to_date('24-11-2017', 'dd-mm-yyyy'), to_date('03-01-2016', 'dd-mm-yyyy'), 5661359651);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (3515656539, 165.00, to_date('01-03-2019', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 9848367623);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (7717157591, 49.00, to_date('17-12-2018', 'dd-mm-yyyy'), to_date('11-08-2016', 'dd-mm-yyyy'), 4687272626);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (4155942849, 3.00, to_date('02-06-2017', 'dd-mm-yyyy'), to_date('14-08-2015', 'dd-mm-yyyy'), 9346399791);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (9745146425, 299.00, to_date('15-01-2018', 'dd-mm-yyyy'), to_date('09-03-2016', 'dd-mm-yyyy'), 2918995427);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (2211471972, 19.00, to_date('27-02-2019', 'dd-mm-yyyy'), to_date('21-08-2021', 'dd-mm-yyyy'), 4249811245);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (3499435899, 39.00, to_date('09-10-2019', 'dd-mm-yyyy'), to_date('26-09-2016', 'dd-mm-yyyy'), 9877814153);

insert into SIVAN.DEBT (DEBT_ID, DEBT_PRICE, DEBT_CREATE, DEBT_LAST_DATE, TAX_ID)
values (3223112277, 38.00, to_date('01-05-2019', 'dd-mm-yyyy'), to_date('21-08-2019', 'dd-mm-yyyy'), 1942157435);

commit;

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (2918436992, '18231 Oakridge Parkway', 862, ' hotel', to_date('01/02/2021', 'DD/MM/YYYY'), to_date('13/12/2021', 'DD/MM/YYYY'), 1568965874);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (3977916915, '15275 Sachtjen Lane', 839, ' office', to_date('20/04/2021', 'DD/MM/YYYY'), to_date('16/07/2023', 'DD/MM/YYYY'), 1542369856);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (4208510125, '3 Merrick Alley', 563, 'office', to_date('28/09/2021', 'DD/MM/YYYY'), to_date('22/04/2023', 'DD/MM/YYYY'), 1523698569);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (4674107237, '9951 2nd Point', 347, 'Hotel', to_date('07/04/2021', 'DD/MM/YYYY'), to_date('01/03/2022', 'DD/MM/YYYY'), 9643948722);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (3815957283, '9878 Goodland Place', 344, 'office', to_date('23/06/2021', 'DD/MM/YYYY'), to_date('15/03/2022', 'DD/MM/YYYY'), 1998974929);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (2542080761, '5981 Derek Center', 928, 'Apartment', to_date('21/04/2021', 'DD/MM/YYYY'), to_date('07/11/2023', 'DD/MM/YYYY'), 4866413555);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (4789866775, '76143 Helena Alley', 422, 'Apartment', to_date('11/09/2021', 'DD/MM/YYYY'), to_date('27/09/2023', 'DD/MM/YYYY'), 7119638695);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (1910110789, '34 Manley Center', 770, 'land', to_date('20/03/2021', 'DD/MM/YYYY'), to_date('19/08/2022', 'DD/MM/YYYY'), 1472964258);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (7554320950, '599 Moulton Junction', 300, 'Apartment', to_date('18/03/2021', 'DD/MM/YYYY'), to_date('25/11/2021', 'DD/MM/YYYY'), 7534254276);

insert into asset (asset_id, asset_address, asset_area, asset_type, asset_purchase, asset_change, tax_id)
values (3788893408, '68 Golf Terrace', 258, 'Apartment', to_date('20/02/2021', 'DD/MM/YYYY'), to_date('20/12/2021', 'DD/MM/YYYY'), 5796492881);

commit;

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (1751609106, 719786493);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (8736421640, 649328127);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (3258969786, 281183263);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (6081880622, 264286847);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (4914950164, 588855746);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (8164753030, 914199663);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (9268249802, 145443376);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (2486925077, 195985798);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (3295205865, 675131781);

insert into TEHILA.OWNERSHIP (ASSET_ID, RESIDENT_ID)
values (8429461726, 589619935);

commit;
