#!/usr/bin/python

import csv, sqlite3

con = sqlite3.connect("test.db")
cur = con.cursor()
cur.execute("create table relA(RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB);") # use your column names here
cur.execute("create table relB(RecID,FirstName,MiddleName,LastName,Address,City,State,ZIP,POBox,POCityStateZip,SSN,DOB);")

with open('/Users/seema/Documents/Semester1/Data Integration/Task1/relationA.csv','rb') as relA: # `with` statement available in 2.5+
    # csv.DictReader uses first line in file for column headings by default
    dr = csv.DictReader(relA) # comma is default delimiter
    to_db = [(i['RecID'], i['Name'], i['Address'], i['City State Zip'], i['PO Box'], i['POCity State Zip'], i['SSN'], i['DOB']) for i in dr]

cur.executemany("INSERT INTO relA(RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB) VALUES (?, ?,?,?,?,?,?,?);", to_db)

with open('/Users/seema/Documents/Semester1/Data Integration/Task1/relationB.csv','rb') as relB: # `with` statement available in 2.5+
    # csv.DictReader uses first line in file for column headings by default
    dr = csv.DictReader(relB) # comma is default delimiter
    to_db = [(i['RecID'], i['FirstName'], i['MiddleName'], i['LastName'], i['Address'], i['City'], i['State'], i['ZIP'], i['POBox'], i['POCityStateZip'], i['SSN'], i['DOB']) for i in dr]

cur.executemany("INSERT INTO relB(RecID,FirstName,MiddleName,LastName,Address,City,State,ZIP,POBox,POCityStateZip,SSN,DOB) VALUES (?, ?,?,?,?,?,?,?,?,?,?,?);", to_db)

cur.execute("create table relC(RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB);")
cur.execute("insert into relC(RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB) select RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB from ( select RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB from relA union all select RecID,Name,Address,CityStateZip,POBox,POCityStateZip,SSN,DOB from (select RecID, FirstName || \" \" || MiddleName || \" \" || LastName AS \"Name\", Address, City || \" \" || State || \" \" || Zip AS CityStateZip, POBox,POCityStateZip,SSN,DOB from relB));")

cursor = cur.execute('select * from relC;')
for row in cursor :
	print row

con.commit()
con.close()
