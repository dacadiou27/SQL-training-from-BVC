--M4 L45 Learning Activity 4.5: Create Database & Tables, Add Constraints & Relationships
--1.Create a new database named Membership.
CREATE DATABASE Membership;

--2.Write the CREATE TABLE statements needed to implement the following design in the Membership database.
--	Define IndividualID and GroupID as identity columns.
--	Decide which columns should allow null values, if any, and explain your decision.
--	Define the Dues column with a default of zero and a check constraint to allow only positive values.
use Membership;

CREATE TABLE Individuals
	(
	IndividualID int IDENTITY(1,1),
	FName varchar(20) NOT NULL,-- need to properly identify persons
	LName varchar(20) NOT NULL,
	Age int NOT NULL CHECK (Age >=18), -- need to have the age for legality
	Dues int DEFAULT 0,
	);
CREATE TABLE Groups
	(
	GroupID int IDENTITY (10,10),
	GName varchar(20) NOT NULL,-- need to properly identify groups
	);

--3.Write an ALTER TABLE statement that adds a new column, DuesPaid, to the Individuals table. Use the bit data type, disallow null values, and assign a default Boolean value of False.
ALTER TABLE Individuals
	ADD DuesPaid bit NOT NULL DEFAULT 0;


--4.Write a SQL script named registration-schema.sql that creates a database with the following tables:
--	Student (student_id, name, gpa)
--	Dept (dept_id,name, dean, building, room)
--	Course (dept_id, course_id, name, hours), where dept_id is a foreign key referencing the Dept (dept_id)
--	Enrolled (dept_id, course_id, student_id), where (dept_id, course_id) is a foreign key referencing course (dept_id, course_id) and student_id is a foreign key referencing student (student_id)

--Should have save as "registration-schema.sql"
CREATE DATABASE Registration;

use Registration;

CREATE TABLE Student
	(
	student_id int NOT NULL,
	name varchar(20) NOT NULL,
	gpa float,
	PRIMARY KEY(student_id),
	);

CREATE TABLE Dept
	(
	dept_id int  NOT NULL , 
	name varchar(20) NOT NULL,
	dean varchar(20) NOT NULL,
	building varchar(20) NOT NULL,
	room int NOT NULL CHECK (room >=0),
	PRIMARY KEY(dept_id),
	);

CREATE TABLE Course
	(
	dept_id int  NOT NULL , 
	course_id int  NOT NULL,
	name varchar(20) NOT NULL,
	hours int NOT NULL CHECK (hours >=0),
	FOREIGN KEY(dept_id) REFERENCES Dept(dept_id),
	PRIMARY KEY(dept_id,course_id),
	);

CREATE TABLE Enrolled
	(
	dept_id int  NOT NULL, 
	course_id int  NOT NULL,
	student_id int NOT NULL,
	FOREIGN KEY(dept_id,course_id) REFERENCES Course(dept_id,course_id),
	FOREIGN KEY(student_id) REFERENCES Student(student_id),
	);