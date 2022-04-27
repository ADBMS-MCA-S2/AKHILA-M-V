CREATE DATABASE MOVIEDB;
DROP DATABASE MOVIEDB;

USE MOVIEDB;


CREATE TABLE ACTOR (
	
	Act_id int not null, 
    
	Act_Name varchar(20) not null, 
    
	Act_Gender char(1) not null,
    
	PRIMARY KEY (Act_id)
    
	);
    
 
CREATE TABLE DIRECTOR (
	
	Dir_id int not null,
    
	Dir_Name varchar(20) not null,
    
	Dir_Phone double not null,
    
	PRIMARY KEY(Dir_id)
    
	);
    

CREATE TABLE MOVIES (
	
	Mov_id int not null,
    
	Mov_Title varchar(30) not null,
    
	Mov_Year int not null,
    
	Mov_Lang varchar(15) not null,
    
	Dir_id int not null,
    
	PRIMARY KEY(Mov_id),
    
	FOREIGN KEY(Dir_id) REFERENCES DIRECTOR(Dir_id) ON DELETE CASCADE ON UPDATE CASCADE
    
	);
    

CREATE TABLE MOVIE_CAST (
	
	Act_id int not null, 
    
	Mov_id int not null, 
    
	Mrole varchar(20) not null,
    
	FOREIGN KEY(Act_id) REFERENCES ACTOR(Act_id) ON DELETE CASCADE ON UPDATE CASCADE,
	
	FOREIGN KEY(Mov_id) REFERENCES MOVIES(Mov_id) ON DELETE CASCADE ON UPDATE CASCADE
    
	);
    

CREATE TABLE RATING (
	
	Mov_id int not null,
    
	Rev_Stars float not null,
    
	FOREIGN KEY(Mov_id) REFERENCES MOVIES(Mov_id) ON DELETE CASCADE ON UPDATE CASCADE
    
	); 
    


INSERT INTO ACTOR(Act_id, Act_Name, Act_Gender)VALUES(123,"Nivin","M");

INSERT INTO ACTOR(Act_id, Act_Name, Act_Gender)VALUES(124,"Arathy","F");

INSERT INTO ACTOR(Act_id, Act_Name, Act_Gender)VALUES(125,"Mega","F");

INSERT INTO ACTOR(Act_id, Act_Name, Act_Gender)VALUES(126,"Arun","M");

INSERT INTO ACTOR(Act_id, Act_Name, Act_Gender)VALUES(127,"Ragi","F");



INSERT INTO DIRECTOR (Dir_id,Dir_Name,Dir_Phone)VALUES(213,"Hitchcock",9897969594);

INSERT INTO DIRECTOR (Dir_id,Dir_Name,Dir_Phone)VALUES(214,"Steven Spielberg",9123435432);

INSERT INTO DIRECTOR (Dir_id,Dir_Name,Dir_Phone)VALUES(215,"Hanson",8987656754);

INSERT INTO DIRECTOR (Dir_id,Dir_Name,Dir_Phone)VALUES(216,"Coen",7656453212);

INSERT INTO DIRECTOR (Dir_id,Dir_Name,Dir_Phone)VALUES(217,"Raimi",9087654512);



INSERT INTO MOVIES (Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id)VALUES(312,"Fargo",2012,"English",213);

INSERT INTO MOVIES (Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id)VALUES(313,"Raising Arizona",1995,"Spanish",214);

INSERT INTO MOVIES (Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id)VALUES(314,"Wonder Boys",2017,"English",213);

INSERT INTO MOVIES (Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id)VALUES(315,"Master",2018,"English",214);

INSERT INTO MOVIES (Mov_id,Mov_Title,Mov_Year,Mov_Lang,Dir_id)VALUES(316,"Grand Master",1999,"English",215);



INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(123,312,"Ben");

INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(123,313,"Rony");

INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(124,313,"Alexa");

INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(125,312,"Nairobi");

INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(125,315,"Tokyo");

INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(126,314,"Antony");

INSERT INTO MOVIE_CAST (Act_id,Mov_id,Mrole)VALUES(125,316,"Ann");



INSERT INTO RATING(Mov_id,Rev_Stars)VALUES(312,1.4);
INSERT INTO RATING(Mov_id,Rev_Stars)VALUES(313,3.5); 

INSERT INTO RATING(Mov_id,Rev_Stars)VALUES(314,4.2);
INSERT INTO RATING(Mov_id,Rev_Stars)VALUES(315,6.5); 

INSERT INTO RATING(Mov_id,Rev_Stars)VALUES(316,7.4);

SELECT * FROM ACTOR;

SELECT * FROM DIRECTOR;

SELECT * FROM MOVIES;

SELECT * FROM MOVIE_CAST;

SELECT * FROM RATING;



SELECT Mov_Title FROM MOVIES NATURAL JOIN DIRECTOR WHERE Dir_Name="Hitchcock" AND MOVIES.Dir_id=DIRECTOR.Dir_id;



SELECT Mov_title FROM MOVIES WHERE Mov_id IN 
	(
SELECT Mov_id FROM MOVIE_CAST WHERE Act_id IN 
	(
SELECT Act_id FROM actor WHERE Act_id IN 
	(
SELECT Act_id FROM MOVIE_CAST GROUP BY Act_id HAVING
COUNT(Act_id)>1)));



SELECT Distinct Act_Name FROM ACTOR 
	
	INNER JOIN MOVIE_CAST ON ACTOR.Act_id=MOVIE_CAST.Act_id 
    
	JOIN MOVIES ON MOVIE_CAST.Mov_id=MOVIES.Mov_id
	
	WHERE MOVIES.Mov_Year<2000 OR MOVIES.Mov_Year>2015 AND MOVIES.Mov_id=MOVIE_CAST.Mov_id and ACTOR.Act_id=MOVIE_CAST.Act_id; 
    


SELECT mov_title,MAX(rev_stars)
FROM movies
INNER JOIN rating USING (mov_id)
GROUP BY mov_title
HAVING MAX(rev_stars)>0
ORDER BY mov_title;



SET SQL_SAFE_UPDATES=0;
UPDATE rating
SET rev_stars=5
WHERE mov_id IN 
	(SELECT mov_id FROM movies
WHERE dir_id IN 
	(SELECT dir_id
FROM director
WHERE dir_name='steven spielberg'));
