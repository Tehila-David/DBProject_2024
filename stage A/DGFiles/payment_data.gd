
[General]
Version=1

[Preferences]
Username=
Password=2085
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SIVAN
Name=PAYMENT
Count=400

[Record]
Name=PAYMENT_ID
Type=NUMBER
Size=15
Data=[1111111111]
Master=

[Record]
Name=PAYMENT_AMOUNT
Type=NUMBER
Size=15
Data=Random(500, 6000)
Master=

[Record]
Name=PAYMENT_TYPE
Type=VARCHAR2
Size=20
Data=List('Credit', 'Cash', 'Check')
Master=

[Record]
Name=PAYMENT_DATE
Type=DATE
Size=
Data=Random(01-01-2015, 01-01-2024)
Master=

[Record]
Name=PAYMENT_RECEIPT
Type=DATE
Size=
Data=Random(01-01-2015, 01-01-2024)
Master=

[Record]
Name=TAX_ID
Type=NUMBER
Size=15
Data=List(select tax_id from tax_account)
Master=

