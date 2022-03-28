CREATE DATABASE MOVIE;

USE MOVIE;

CREATE TABLE directors (
	director varchar(20) NOT NULL,
	dyear int NOT NULL,
	PRIMARY KEY(director)
	);
   
CREATE TABLE movies (
	title varchar(30) NOT NULL,
	director varchar(20) NOT NULL,
	myear int NOT NULL,
	rating float NOT NULL,
	PRIMARY KEY(title),
	FOREIGN KEY (director) REFERENCES directors (director)
	);

CREATE TABLE actors (
	actor varchar(20) NOT NULL,
	ayear int NOT NULL,
	PRIMARY KEY(actor)
	);
    
CREATE TABLE acts (
	actor varchar(20) NOT NULL,
	title varchar(30) NOT NULL,
	FOREIGN KEY (actor) REFERENCES actors (actor),
	FOREIGN KEY (title) REFERENCES movies (title)
	);
    
INSERT INTO directors(director,dyear) VALUES("Coen",1954);
INSERT INTO directors(director,dyear) VALUES("Hanson",1945);
INSERT INTO directors(director,dyear) VALUES("Raimi",1959);

INSERT INTO movies(title,director,myear,rating) VALUES("Fargo","Coen",1996,8.2);
INSERT INTO movies(title,director,myear,rating) VALUES("Raising Arizona","Coen",1987,7.6);
INSERT INTO movies(title,director,myear,rating) VALUES("Spiderman","Raimi",2002,7.4);
INSERT INTO movies(title,director,myear,rating) VALUES("Wonder Boys","Hanson",2000,7.6);

INSERT INTO actors(actor,ayear) VALUES("Cage",1964);
INSERT INTO actors(actor,ayear) VALUES("Hanks",1956);
INSERT INTO actors(actor,ayear) VALUES("Maguire",1975);
INSERT INTO actors(actor,ayear) VALUES("McDormand",1957);

INSERT INTO acts(actor,title) VALUES("Cage","Raising Arizona");
INSERT INTO acts(actor,title) VALUES("Maguire","Spiderman");
INSERT INTO acts(actor,title) VALUES("Maguire","Wonder Boys");
INSERT INTO acts(actor,title) VALUES("McDormand","Fargo");
INSERT INTO acts(actor,title) VALUES("McDormand","Raising Arizona");
INSERT INTO acts(actor,title) VALUES("McDormand","Wonder Boys");

SELECT * FROM movies;
SELECT * FROM directors;
SELECT * FROM actors;
SELECT * FROM acts;

SELECT title FROM movies WHERE myear>1997;

SELECT title FROM movies WHERE director="Hanson" AND myear>1997;

SELECT title,rating FROM movies;

CREATE VIEW actdir AS SELECT actors.actor,directors.director FROM actors,directors;
SELECT * FROM actdir;

SELECT movies.title FROM movies,acts WHERE director="Coen" AND actor="McDormand" AND movies.title=acts.title;