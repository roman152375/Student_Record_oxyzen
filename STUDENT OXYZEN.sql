USE master; 

DROP DATABASE IF EXISTS StudentsRecord;

CREATE DATABASE StudentsRecord
GO

USE StudentsRecord;
GO



CREATE SCHEMA StudentsRecord
GO

DROP TABLE IF EXISTS StudentsRecord.Student;
CREATE TABLE Student(
StudentId INT PRIMARY KEY,
FirstName varchar (50) NOT NULL,
LastName varchar (50) NOT NULL,
DateOfBirth int NOT NULL,
PhoneNumber bigint,
AddressLine1 varchar (250) NOT NULL,
AddressLine2 varchar (250) NOT NULL,
PostCode varchar (10) NOT NULL,
City varchar (50) NOT NULL,
Country varchar (15) NOT NULL
);
GO

CREATE TABLE ParentsInformation(
ParentsId INT PRIMARY KEY,
FatherName varchar (50) NOT NULL,
MotherName varchar (50) NOT NULL,
PhoneNumber bigint
);
GO


CREATE TABLE Scholarship(
ScholarshipId INT PRIMARY KEY,
ScholarshipName varchar (150) NOT NULL,
Amount decimal (10,2) NOT NULL,
ScolarchipDescr varchar (500)
);
GO

CREATE TABLE Institution(
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

CREATE TABLE Program(
ProgramId INT PRIMARY KEY,
ProgramName varchar (100) NOT NULL,
StartingDate INT,
EndingDate INT,
ProgramDuration INT
);
GO

CREATE TABLE Course(
CourseId INT PRIMARY KEY,
CourseName varchar (80) NOT NULL,
CourseModule varchar (100) NOT NULL,
TimeTable INT
);
GO

CREATE TABLE Student_Parents(
StudentId INT,
ParentsId INT
); 
GO 

CREATE TABLE Student_Course(
StudentId INT,
CourseId INT
);
GO


ALTER TABLE Student_Parents
ADD CONSTRAINT FKStudentId 
FOREIGN KEY (StudentId) REFERENCES Student(StudentId);
GO

ALTER TABLE Student_Parents
ADD CONSTRAINT FKParentsId
FOREIGN KEY (ParentsId) REFERENCES ParentsInformation(ParentsId);
GO

ALTER TABLE Student_Course
ADD CONSTRAINT FKStudentId_C
FOREIGN KEY (StudentId) REFERENCES Student (StudentId);
GO

ALTER TABLE Student_Course
ADD CONSTRAINT FKCourseId
FOREIGN KEY (CourseId) REFERENCES Course (CourseId);
GO


