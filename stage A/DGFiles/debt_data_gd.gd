
[General]
Version=1

[Preferences]
Username=
Password=2238
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SIVAN
Name=DEBT
Count=400

[Record]
Name=DEBT_ID
Type=NUMBER
Size=15
Data=[1111111111]
Master=

[Record]
Name=DEBT_PRICE
Type=NUMBER
Size=15
Data=Components.Price
Master=

[Record]
Name=DEBT_CREATE
Type=DATE
Size=
Data=Random(01-01-2017, 01-01-2020)
Master=

[Record]
Name=DEBT_LAST_DATE
Type=DATE
Size=
Data=Random(12-01-2010, 01-01-2024)
Master=

[Record]
Name=TAX_ID
Type=NUMBER
Size=15
Data=List(select tax_id from tax_account)
Master=

