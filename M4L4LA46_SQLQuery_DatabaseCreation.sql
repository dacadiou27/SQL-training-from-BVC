--M4 L46 Learning Activity 4.6: Create Database & Tables, Add Constraints & Relationships
--Create a database called Film_World and write SQL statements to create a database with the tables from the following ERD:
--Assume the following:

--1. Primary keys are indicated in bold.
--2. Foreign keys are indicated in italics.
--3. Review score can be any value between 0 and 10, inclusive.
--4. Movies without set release dates are allowed.
--5. Movies without a title are not allowed.

CREATE DATABASE Film_World;

use Film_World;

CREATE TABLE Movies
	(
	movieId int NOT NULL,
	title varchar(255) NOT NULL,
	companyId int NOT NULL,
	releaseDate datetime ,
	boxOfficeRevenue int,
	reviewScore float CHECK (reviewScore >= 0 AND reviewScore <= 10),
	PRIMARY KEY(movieId),
	);

CREATE TABLE Actor
	(
	actorId int NOT NULL,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	dateOfBirth datetime,
	PRIMARY KEY(actorId),
	);

CREATE TABLE ActedIn
	(
	movieId int NOT NULL,
	actorId int NOT NULL,
	PRIMARY KEY(movieId,actorId),
	FOREIGN KEY (movieId) REFERENCES Movies(movieId),
	FOREIGN KEY (actorId) REFERENCES Actor(actorId),
	);

