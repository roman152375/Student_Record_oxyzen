CREATE DATABASE StudentsRecord
GO


CREATE SCHEMA StudentsRecord
GO


CREATE TABLE StudentsRecord.Student(
StudentId INT PRIMARY KEY,
FirstName varchar (50) NOT NULL,
LastName varchar (50) NOT NULL,
DateOfBirth int NOT NULL,
PhoneNumber int,
AddressLine1 varchar (250) NOT NULL,
AddressLine2 varchar (250) NOT NULL,
PostCode varchar (10) NOT NULL,
City varchar (50) NOT NULL,
Country varchar (15) NOT NULL,
);
GO

CREATE TABLE StudentsRecord.ParentsInformation(
ParentsId INT PRIMARY KEY,
FatherName varchar (50) NOT NULL,
MotherName varchar (50) NOT NULL,
PhoneNumber INT
);
GO


CREATE TABLE StudentsRecord.Scholarship(
ScholarshipId INT PRIMARY KEY,
ScholarshipName varchar (150) NOT NULL,
Amount decimal (10,2) NOT NULL,
ScolarchipDescr varchar (500)
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
PhoneNumber INT
);
GO

CREATE TABLE StudentsRecord.Program(
ProgramId INT PRIMARY KEY,
ProgramName varchar (100) NOT NULL,
StartingDate INT,
EndingDate INT,
ProgramDuration INT
);
GO

CREATE TABLE StudentsRecord.Course(
CourseId INT PRIMARY KEY,
CourseName varchar (80) NOT NULL,
CourseModule varchar (100) NOT NULL,
TimeTable INT
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


ALTER TABLE StudentsRecord.Student_Parents
ADD CONSTRAINT FKStudentId 
FOREIGN KEY (StudentId) REFERENCES StudentsRecord.Student(StudentId);
GO

ALTER TABLE StudentsRecord.Student_Parents
ADD CONSTRAINT FKParentsId
FOREIGN KEY (ParentsId) REFERENCES StudentsRecord.ParentsInformation(ParentsId);
GO

ALTER TABLE StudentsRecord.Student_Course
ADD CONSTRAINT FKStudentId_C
FOREIGN KEY (StudentId) REFERENCES StudentsRecord.Student (StudentId);
GO

ALTER TABLE StudentsRecord.Student_Course
ADD CONSTRAINT FKCourseId
FOREIGN KEY (CourseId) REFERENCES StudentsRecord.Course (CourseId);
GO
