
[General]
Version=1

[Preferences]
Username=
Password=2042
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SIVAN
Name=TAX_ACCOUNT
Count=400

[Record]
Name=TAX_ID
Type=NUMBER
Size=15
Data=[1111111111]
Master=

[Record]
Name=TAX_PRICE
Type=NUMBER
Size=15
Data=Components.Price
Master=

[Record]
Name=TAX_CREATE
Type=DATE
Size=
Data=Random(01-01-2010, 01-01-2018)
Master=

[Record]
Name=TAX_CLOSE
Type=DATE
Size=
Data=Random(10-01-2018, 01-01-2025)
Master=

