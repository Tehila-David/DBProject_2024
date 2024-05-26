
[General]
Version=1

[Preferences]
Username=
Password=2492
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TEHILA
Name=OWNERSHIP
Count=404

[Record]
Name=ASSET_ID
Type=NUMBER
Size=15
Data=List(select asset_id from asset)
Master=

[Record]
Name=RESIDENT_ID
Type=NUMBER
Size=9
Data=List(select resident_id from resident)
Master=

