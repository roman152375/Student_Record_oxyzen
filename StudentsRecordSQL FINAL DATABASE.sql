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


insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (3, 'Davine', 'Corsan', '2018-12-12', '3685464859', '6270 Onsgard Hill', 'Eliot', 'Y4E-4F8', 'Donostia-San Sebastian', 'Spain');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (4, 'Andreana', 'Atherley', '2019-07-04', '3661571895', '47 Service Trail', 'Buhler', 'M8D-4C6', 'Rouen', 'France');

insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (1, 'Patty Cannop', 'Randie Dunton', '3913742056');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (2, 'Daisie Middlemass', 'Raleigh Birrel', '9955028131');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (3, 'Hirsch Waistall', 'Johann Cutsforth', '2231490978');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (4, 'Trenna Brushneen', 'Lauren Towns', '3816069809');


insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (1, 'Dorice Cordrey', '139 Bartillon Lane', 'Moose', 'A3H-1A4', 'Bajingmeduro', 'Indonesia', '5483978700');

insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (1, 'CSC', '2018-12-12', '2019-05-01', 4);
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (2, 'CSC', '2018-12-12', '2019-05-01', 3);

insert into StudentsRecord.Course (CourseId, CourseName, CourseModule, TimeTable) values (1, 'Math', 'Training', '10:42');
insert into StudentsRecord.Course (CourseId, CourseName, CourseModule, TimeTable) values (2, 'French', 'Services', '8:51');
insert into StudentsRecord.Course (CourseId, CourseName, CourseModule, TimeTable) values (3, 'Math', 'Research and Development', '13:09');
insert into StudentsRecord.Course (CourseId, CourseName, CourseModule, TimeTable) values (4, 'Math', 'Marketing', '9:46');


insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (1, 'Babblestorm', '$5799.02', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.');