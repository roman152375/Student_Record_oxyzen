USE master;
GO


DROP DATABASE IF EXISTS StudentsRecord;
GO

CREATE DATABASE StudentsRecord;
GO

USE StudentsRecord;

CREATE SCHEMA StudentsRecord
GO

--this is our base table 

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
	ProgramDuration varchar (20)
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

--this is our FOREIGN KEY tables
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

--we use CHECK constraint 

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
	ADD CONSTRAINT Phone_Number CHECK (PhoneNumber >= 10);
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
	ADD CONSTRAINT Phone_Number_Institution CHECK (LEN (PhoneNumber) >= 10);
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

--default
ALTER TABLE StudentsRecord.Scholarship
	ADD CONSTRAINT DFLTScholarship
	DEFAULT ('Not Applicable') FOR ScholarshipDescr;
GO




--this is our VIEW tables
CREATE VIEW StudentsRecord.CanadianStudentList AS
	SELECT * FROM StudentsRecord.Student
	WHERE Country = 'Canada';
GO
CREATE VIEW StudentsRecord.NonCanadianStudentList as
	SELECT * FROM StudentsRecord.Student
	WHERE Country <> 'Canada';
GO

CREATE VIEW StudentsRecord.InstitutionOfToronto AS
	SELECT * FROM StudentsRecord.Institution
	WHERE City = 'Toronto';
GO

--CREATING INDEX

CREATE INDEX LastName ON StudentsRecord.Student (LastName)
WHERE LastName IS NOT NULL; 
GO

CREATE INDEX CourseName ON StudentsRecord.Course (CourseName)
WHERE CourseName is not null;
GO

CREATE INDEX FatherName on StudentsRecord.ParentsInformation (FatherName)
WHERE FatherName is not null;
GO

--CREATE PROCEDURE

CREATE PROCEDURE StudentsRecord.Student_Update
	@StudentId int,
	@FirstName varchar (50),
	@LastName varchar (50)
AS
	UPDATE StudentsRecord.Student
	SET FirstName = @FirstName,
		LastName = @LastName
	WHERE StudentId = @StudentId;
GO

CREATE PROCEDURE StudentsRecord.Course_Delete
	@CourseId int,
	@CourseName varchar (80)
AS
	DELETE StudentsRecord.Course
	WHERE CourseId = @CourseId
GO



--insert statements from mockaroo
--Student table
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (11, 'Sophi', 'Oak', '2019-04-28', '1294310290', '796 Bonner Alley', 'Talisman', '656565', 'Karlivka', 'Ukraine');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (21, 'Rutledge', 'Wainscoat', '2019-12-16', '5935904155', '230 Packers Parkway', 'Loeprich', '333344', 'Krajan Pundungsari', 'Indonesia');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (31, 'Laurence', 'Ronaghan', '2019-10-26', '3402532373', '11629 Hazelcrest Crossing', 'Ilene', '45o678', 'Al Maşlūb', 'Yemen');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (41, 'Alva', 'Loveguard', '2019-10-29', '9832181668', '40 3rd Lane', 'Helena', '654677', 'Chapimarca', 'Peru');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (51, 'Augustina', 'Dance', '2019-01-21', '4283858927', '8364 Derek Court', 'Pond', '006960', 'Sahline', 'Tunisia');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (61, 'Drucy', 'Albery', '2019-10-04', '3863664136', '9 Golf View Circle', 'Mifflin', '39-323', 'Mielec', 'Poland');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (71, 'Devy', 'Canet', '2019-11-05', '9807308896', '67492 Porter Junction', 'Fairview', '660066', 'Santa Elena de Uairén', 'Venezuela');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (81, 'Phillie', 'Asipenko', '2018-12-22', '7917802655', '739 Corry Junction', 'High Crossing', '65y566', 'Beruniy', 'Uzbekistan');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (91, 'Bobby', 'Santostefano.', '2019-03-15', '7365607378', '779 Homewood Plaza', 'Hanover', '668899', 'Niandui', 'China');
insert into StudentsRecord.Student (StudentId, FirstName, LastName, DateOfBirth, PhoneNumber, AddressLine1, AddressLine2, PostCode, City, Country) values (101, 'Jourdan', 'Blasius', '2019-12-02', '8115455599', '3 Stang Road', 'Orin', '456510', 'Dolgoderevenskoye', 'Russia');
select * from StudentsRecord.Program
--ParentsInformation table
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (1, 'Verne Master', 'Bald Deme', '6149986160');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (2, 'Alexander Teml', 'Corny Medhurst', '2444955954');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (3, 'Josy Turfitt', 'Chantal Smedley', '4675585495');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (4, 'Burtie Kohlerman', 'Trula Gittis', '5355450939');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (5, 'Gert Alker', 'Ebony Hawlgarth', '6292923574');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (6, 'Ursola Heinritz', 'Flossi Robak', '4047647612');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (7, 'Magdalena O'' Mahony', 'Rafi Pendock', '3889885937');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (8, 'Vicki Massy', 'Karly Georgel', '6944376693');
insert into StudentsRecord.ParentsInformation (ParentsId, FatherName, MotherName, PhoneNumber) values (9, 'Xenos Roo', 'Emlynne Monnelly', '3513415042');


--Institution table
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (1, 'Eayo', '276 Division Plaza', 'New Castle', 'L-9395', 'Tandel', 'Luxembourg', '7316605150');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (2, 'Yotz', '2419 Gulseth Parkway', 'Charing Cross', '50o995', 'Ukata', 'Nigeria', '1277438776');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (3, 'Mudo', '6715 Ryan Road', 'Scott', '556yyy', 'Toronto', 'Canada', '3562730504');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (4, 'Gigabox', '3024 Clyde Gallagher Street', 'Declaration', '58585', 'Capellanía', 'Panama', '6537307479');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (5, 'Feedspan', '8876 Melvin Center', 'Pepper Wood', '4671', 'Kristiansand S', 'Norway', '5873433910');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (6, 'Yacero', '21044 Weeping Birch Crossing', 'Pankratz', '4400', 'Salta', 'Argentina', '4072603231');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (7, 'Trudoo', '624 Brickson Park Plaza', 'Browning', '660055', 'Serang', 'Indonesia', '2056300168');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (8, 'Blogspan', '96660 Luster Terrace', 'Hooker', '69i996', 'Toronto', 'Canada', '9753386158');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (9, 'Yodo', '81 Pine View Hill', 'Crowley', '1091', 'Batobato', 'Philippines', '5811014225');
insert into StudentsRecord.Institution (DLINumber, InstitutionName, AddressLine1, AddressLine2, PostCode, City, Country, PhoneNumber) values (10, 'Minyx', '5205 Meadow Vale Lane', 'Dixon', '5504', 'Toronto', 'Canada', '3414543406');

--Program table
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (1, 'Merck & Company, Inc.', '5/28/2019', '7/9/2020', '6 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (2, 'Nomura Holdings Inc ADR', '8/24/2019', '3/25/2020', '4 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (3, 'Kennedy-Wilson Holdings Inc.', '5/9/2019', '7/21/2020', '6 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (4, 'Cincinnati Bell Inc', '1/9/2019', '2/21/2020', '4 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (5, 'Randgold Resources Limited', '6/21/2019', '1/27/2020', '3 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (6, 'FS Investment Corporation', '12/26/2018', '7/14/2020', '4 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (7, 'Fortis Inc.', '2/8/2019', '6/20/2020', '2 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (8, 'CHF Solutions, Inc.', '5/12/2019', '4/29/2020', '3 months');
insert into StudentsRecord.Program (ProgramId, ProgramName, StartingDate, EndingDate, ProgramDuration) values (9, 'Welltower Inc.', '9/29/2019', '1/13/2020', '6 months');

--Course table

insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (1, 'Mesa Royalty Trust', 'BIOLOGY', '19:32');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (2, 'Grupo Financiero Santander Mexico S.A. B. de C.V.', 'BIOLOGY', '20:17');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (3, 'Atlantic Alliance Partnership Corp.', 'ENGLISH', '19:41');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (4, 'Quantum Corporation', 'CHEMISTRY', '18:32');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (5, 'Lantronix, Inc.', 'BIOLOGY', '20:16');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (16, 'K12 Inc', 'BIOLOGY', '17:20');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (17, 'RealPage, Inc.', 'PHYSICS', '20:42');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (8, 'Cyanotech Corporation', 'CSE', '18:55');
insert into StudentsRecord.Course (courseId, CourseName, CourseModule, TimeTable) values (9, 'Hibbett Sports, Inc.', 'BIOLOGY', '20:32');

--Scholarship table
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (11, 'Ligand Pharmaceuticals Incorporated', '$681.49', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (12, 'Seneca Foods Corp.', '$865.59', 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (3, 'Lincoln National Corporation', '$844.32', 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (4, 'SandRidge Mississippian Trust II', '$697.58', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (5, 'On Deck Capital, Inc.', '$528.43', 'Fusce consequat. Nulla nisl.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (6, 'Lehman ABS Corporation', '$924.98', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (7, 'BCE, Inc.', '$925.53', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (8, 'Signature Bank', '$566.79', 'Suspendisse accumsan tortor quis turpis. Sed ante.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (9, 'Home BancShares, Inc.', '$522.22', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.');
insert into StudentsRecord.Scholarship (ScholarshipId, ScholarshipName, Amount, ScholarshipDescr) values (10, 'Silicon Motion Technology Corporation', '$867.50', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.');

