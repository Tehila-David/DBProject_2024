
[General]
Version=1

[Preferences]
Username=
Password=2800
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SIVAN
Name=RESIDENT
Count=400

[Record]
Name=RESIDENT_ID
Type=NUMBER
Size=9
Data=[111111111]
Master=

[Record]
Name=RESIDENT_FNAME
Type=VARCHAR2
Size=16
Data=FirstName 
Master=

[Record]
Name=RESIDENT_LNAME
Type=VARCHAR2
Size=16
Data=LastName
Master=

[Record]
Name=RESIDENT_BIRTH
Type=DATE
Size=
Data=Random(01-01-1980, 01-01-2000)
Master=

[Record]
Name=RESIDENT_ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

[Record]
Name=RESIDENT_PHONE
Type=NUMBER
Size=10
Data=List('54', '50', '52') +[0000000]
Master=

[Record]
Name=RESIDENT_JOINING
Type=DATE
Size=
Data=Random(02-01-2000, 01-01-2024)
Master=

