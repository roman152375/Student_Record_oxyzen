CREATE DATABASE StudentsRecord
GO

USE StudentsRecord;
GO


CREATE SCHEMA StudentsRecord
GO


CREATE TABLE StudentsRecord.Student(
StudentId INT PRIMARY KEY,
FirstName varchar (50) NOT NULL,
LastName varchar (50) NOT NULL,
DateOfBirth date NOT NULL,
PhoneNumber bigint,
AddressLine1 varchar (250) NOT NULL,
AddressLine2 varchar (250) NOT NULL,
PostCode varchar (10) NOT NULL,
City varchar (50) NOT NULL,
Country varchar (15) NOT NULL
);
GO


CREATE TABLE StudentsRecord.ParentsInformation(
ParentsId INT PRIMARY KEY,
FatherName varchar (50) NOT NULL,
MotherName varchar (50) NOT NULL,
PhoneNumber bigint
);
GO

CREATE TABLE StudentsRecord.Institution(
DLINumber INT PRIMARY KEY,
InstitutionName varchar (250) NOT NULL,
Addressline1 varchar (250) NOT NULL,
AddressLine2 varchar (250) NOT NULL,
Postcode varchar (10) NOT NULL,
City varchar (50) NOT NULL,
Country varchar (15) NOT NULL,
PhoneNumber bigint
);
GO


CREATE TABLE StudentsRecord.Program(
ProgramId INT PRIMARY KEY,
ProgramName varchar (100) NOT NULL,
StartingDate DATE,
EndingDate DATE,
ProgramDuration INT
);
GO

CREATE TABLE StudentsRecord.Course(
CourseId INT PRIMARY KEY,
CourseName varchar (80) NOT NULL,
CourseModule varchar (100) NOT NULL,
TimeTable time
);
GO

CREATE TABLE StudentsRecord.Scholarship(
ScholarshipId INT PRIMARY KEY,
ScholarshipName varchar (150) NOT NULL,
Amount money  NOT NULL,
ScholarshipDescr varchar (500)
);
GO

CREATE TABLE StudentsRecord.Student_Parents(
StudentId INT,
ParentsId INT
); 
GO 

CREATE TABLE StudentsRecord.Student_Course(
StudentId INT,
CourseId INT
);
GO



ALTER TABLE StudentsRecord.Student
ADD CONSTRAINT TheStudentId CHECK (LEN (StudentId) > 0);
GO
ALTER TABLE StudentsRecord.Student
ADD CONSTRAINT Day_Of_Birth CHECK (year (DateOfBirth) > 1900/01/01);
GO
ALTER TABLE StudentsRecord.Student
ADD CONSTRAINT ValidCityName CHECK (LEN(City) > 2);
GO

ALTER TABLE StudentsRecord.ParentsInformation
ADD CONSTRAINT Parents_Id CHECK (LEN(ParentsId) > 0);
GO
ALTER TABLE StudentsRecord.ParentsInformation
ADD CONSTRAINT Phone_Number CHECK (PhoneNumber > 10000000);
GO

ALTER TABLE StudentsRecord.Institution 
ADD CONSTRAINT Instituion_Number CHECK (LEN (DLINumber) > 0);
GO
ALTER TABLE StudentsRecord.Institution 
ADD CONSTRAINT Address1 CHECK (LEN (AddressLine1) > 2);
GO
ALTER TABLE StudentsRecord.Institution 
ADD CONSTRAINT Address2 CHECK (LEN (AddressLine2) > 2);
GO
ALTER TABLE StudentsRecord.Institution 
ADD CONSTRAINT City_Name CHECK (LEN (City) > 2);
GO
ALTER TABLE StudentsRecord.Institution 
ADD CONSTRAINT Phone_Number_Institution CHECK (LEN (PhoneNumber) > 10000000);
GO


ALTER TABLE StudentsRecord.Program
ADD CONSTRAINT Program_Id CHECK (LEN (ProgramId) > 0);
GO
ALTER TABLE StudentsRecord.Program
ADD CONSTRAINT Name_Program CHECK (LEN (ProgramName) > 1);
GO
ALTER TABLE StudentsRecord.Program
ADD CONSTRAINT Starting_Date CHECK (StartingDate >= '2019/11/25'); 
GO
ALTER TABLE StudentsRecord.Program
ADD CONSTRAINT Ending_Date CHECK (EndingDate <= '2020/04/01');
GO

ALTER TABLE StudentsRecord.Course
ADD CONSTRAINT Course_ID CHECK ( LEN (CourseId) > 0);
GO
ALTER TABLE StudentsRecord.Course
ADD CONSTRAINT Course_Name CHECK (LEN (CourseName) > 1);
GO
ALTER TABLE StudentsRecord.Course
ADD CONSTRAINT Course_Module CHECK (LEN (CourseModule) > 0);
GO
ALTER TABLE StudentsRecord.Course
ADD CONSTRAINT Course_Timetable CHECK (TimeTable >='17:00' AND  TimeTable <='21:00');
GO

ALTER TABLE StudentsRecord.Scholarship
ADD CONSTRAINT Scholarship_Id CHECK (LEN (ScholarshipId) > 0);
GO
ALTER TABLE StudentsRecord.Scholarship
ADD CONSTRAINT Scholarship_name CHECK (LEN (ScholarshipName) > 4);
GO
ALTER TABLE StudentsRecord.Scholarship
ADD CONSTRAINT Scholarship_Amount CHECK (Amount >= 500);
GO
ALTER TABLE StudentsRecord.Scholarship
ADD CONSTRAINT Descr CHECK (LEN (ScholarshipDescr) >10);
GO
ALTER TABLE StudentsRecord.Scholarship
ADD CONSTRAINT DFLTScholarship
DEFAULT ('Not Applicable') FOR ScholarshipDescr;
GO

INSERT INTO StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr)
VALUES (1, 'QueenMary', $500, DEFAULT);
GO

INSERT INTO StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2,
PostCode, City, Country)
VALUES (555, 'John', 'Martin', '2000/01/01', '0141710717', 'BloorWest', 'Unit2', 'J4J3I9', 'TORONTO', DEFAULT);
GO

