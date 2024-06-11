
#Constraint 1
Alter table payment
Modify payment_type default 'Credit'

#check
insert into payment(payment_id,payment_amount, payment_date, payment_receipt,tax_id)
values(4855219991,230,to_date('20-11-2021','dd-mm,yyyy'),to_date('20-11-2022','dd-mm,yyyy'),5718998928);
select * from payment where payment_id =4855219991

            
#Constraint 2
Alter table tax_account
add constraint check_tax_close
check (tax_close >=  tax_create);

#check- error
insert into tax_account(tax_id,tax_price, tax_create, tax_close)
values(12345678,450,to_date('20-11-2019','dd-mm,yyyy'),to_date('20-11-2018','dd-mm,yyyy'))



#Constraint 3
Alter table tax_account 
modify tax_price NOT NULL;

#check- error
insert into  tax_account(tax_id, tax_create, tax_close)
values(5718998923,to_date('20-11-2019','dd-mm,yyyy'),to_date('20-11-2020','dd-mm,yyyy'))


























