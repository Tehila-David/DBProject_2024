
[General]
Version=1

[Preferences]
Username=
Password=2994
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SIVAN
Name=DISCOUNT
Count=400

[Record]
Name=DISCOUNT_ID
Type=NUMBER
Size=15
Data=[11111]
Master=

[Record]
Name=DISCOUNT_PERCENT
Type=NUMBER
Size=10
Data=[11]
Master=

[Record]
Name=DISCOUNT_TYPE
Type=VARCHAR2
Size=80
Data=List('שירות לאומי', 'שירות צבאי','נכה',' אלמן/ה',' הורה יחיד', 'רמת הכנסה נמוכה')
Master=

[Record]
Name=DISCOUNT_START
Type=DATE
Size=
Data=Random(01-01-2000, 01-01-2005)
Master=

[Record]
Name=DISCOUNT_END
Type=DATE
Size=
Data=Random(14-01-2005, 01-01-2008)
Master=

[Record]
Name=RESIDENT_ID
Type=NUMBER
Size=9
Data=List(select resident_id from resident)
Master=

