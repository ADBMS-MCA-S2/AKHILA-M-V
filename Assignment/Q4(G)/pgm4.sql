CREATE DATABASE Library;

DROP DATABASE Library;

USE Library;

CREATE TABLE PUBLISHER(
    Publisher_Name varchar(35) not null,
    Address varchar(55) not null,
    Phone double not null,
    PRIMARY KEY(Publisher_Name)
);
   
CREATE TABLE LIBRARY_BRANCH(
    Branch_id varchar(6) not null,
Branch_Name varchar(30) not null,
Address varchar(55) not null,
    PRIMARY KEY(Branch_id)
);

CREATE TABLE BOOK(
Book_id  varchar(6) not null,
    Title varchar(20) not null,
    Publisher_Name varchar(35) not null,
    Pub_Year year not null,
    PRIMARY KEY(Book_id),
    FOREIGN KEY(Publisher_Name) REFERENCES PUBLISHER(Publisher_Name) ON DELETE CASCADE
);
   
CREATE TABLE BOOK_AUTHORS(
Book_id  varchar(6) not null,
    Author_Name varchar(35) not null,
    PRIMARY KEY(Author_Name),
    FOREIGN KEY(Book_id) REFERENCES BOOK(Book_id) ON DELETE CASCADE
);
 
CREATE TABLE BOOK_COPIES(
Book_id  varchar(6) not null,
    Branch_id  varchar(6) not null,
    No_of_Copies int not null,
    FOREIGN KEY(Book_id) REFERENCES BOOK(Book_id) ON DELETE CASCADE,
    FOREIGN KEY(Branch_id) REFERENCES  LIBRARY_BRANCH(Branch_id) ON DELETE CASCADE
);
   
CREATE TABLE BOOK_LENDING (
Book_id  varchar(6) not null,
    Branch_id  varchar(6) not null,
	Card_No  varchar(6) not null,
    Date_Out date not null,
    Due_Date date not null,
    FOREIGN KEY(Book_id) REFERENCES BOOK(Book_id) ON DELETE CASCADE,
    FOREIGN KEY(Branch_id) REFERENCES  LIBRARY_BRANCH(Branch_id) ON DELETE CASCADE
);

INSERT INTO PUBLISHER (Publisher_Name,Address,Phone)VALUES ("Ramaswami","XYZ Building",9098976545);
INSERT INTO PUBLISHER (Publisher_Name,Address,Phone)VALUES ("Lakshman","ABC Building",9867543423);
INSERT INTO PUBLISHER (Publisher_Name,Address,Phone)VALUES ("Alexander","PQR Building",9767543212);
INSERT INTO PUBLISHER (Publisher_Name,Address,Phone)VALUES ("Muhammad","HIJ Building",8976563423);
INSERT INTO PUBLISHER (Publisher_Name,Address,Phone)VALUES ("Karthika","MNO Building",7898564323);

INSERT INTO LIBRARY_BRANCH(Branch_id,Branch_Name,Address)VALUES ("BR101","Tripunithura","abcd road");
INSERT INTO LIBRARY_BRANCH(Branch_id,Branch_Name,Address)VALUES ("BR102","Tiruvankulam","efgh road");
INSERT INTO LIBRARY_BRANCH(Branch_id,Branch_Name,Address)VALUES ("BR103","Vaikom","ijkl road");
INSERT INTO LIBRARY_BRANCH(Branch_id,Branch_Name,Address)VALUES ("BR104","Cherthala","mnop road");
INSERT INTO LIBRARY_BRANCH(Branch_id,Branch_Name,Address)VALUES ("BR105","Karicode","qrst road");

INSERT INTO BOOK(Book_id,Title,Publisher_Name,Pub_Year)VALUES ("B201","Python","Ramaswami",2004);
INSERT INTO BOOK(Book_id,Title,Publisher_Name,Pub_Year)VALUES ("B202","Java","Lakshman",2002);
INSERT INTO BOOK(Book_id,Title,Publisher_Name,Pub_Year)VALUES ("B203","Web programming","Lakshman",2006);
INSERT INTO BOOK(Book_id,Title,Publisher_Name,Pub_Year)VALUES ("B204","Software Engineering","Muhammad",2010);
INSERT INTO BOOK(Book_id,Title,Publisher_Name,Pub_Year)VALUES ("B205","Data Structure","Karthika",2011);

INSERT INTO  BOOK_AUTHORS(Book_id,Author_Name)VALUES ("B201","Jeeva Jose");
INSERT INTO  BOOK_AUTHORS(Book_id,Author_Name)VALUES ("B202","Sheba K U");
INSERT INTO  BOOK_AUTHORS(Book_id,Author_Name)VALUES ("B203","Nimol");
INSERT INTO  BOOK_AUTHORS(Book_id,Author_Name)VALUES ("B204","Leeja");
INSERT INTO  BOOK_AUTHORS(Book_id,Author_Name)VALUES ("B205","Shaju");

INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B201","BR101",200);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B201","BR102",180);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B202","BR103",380);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B202","BR101",150);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B203","BR104",200);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B203","BR105",400);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B204","BR105",100);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B205","BR104",280);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B205","BR105",200);
INSERT INTO  BOOK_COPIES(Book_id,Branch_id,No_of_Copies)VALUES ("B205","BR101",320);

INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B201","BR101","C301","2017-09-12","2017-09-18");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B203","BR104","C302","2017-01-11","2017-01-20");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B201","BR102","C303","2017-05-12","2017-05-30");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B204","BR105","C304","2017-04-09","2017-04-18");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B205","BR101","C305","2017-02-18","2017-07-29");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B205","BR101","C305","2017-04-18","2017-07-29");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B205","BR101","C305","2017-06-18","2017-07-29");
INSERT INTO  BOOK_LENDING (Book_id,Branch_id,Card_No,Date_Out,Due_Date)VALUES ("B205","BR101","C305","2017-06-18","2017-07-29");



SELECT * FROM PUBLISHER;
SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM BOOK;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LENDING;

SELECT BOOK.Book_id,BOOK.Title,BOOK.Publisher_Name,BOOK_AUTHORS.Author_Name,BOOK_COPIES.Branch_id,BOOK_COPIES.No_of_Copies 
	FROM BOOK,BOOK_AUTHORS,BOOK_COPIES 
    WHERE BOOK.Book_id=BOOK_AUTHORS.Book_id AND  BOOK.Book_id=BOOK_COPIES.Book_id;
    
SELECT * FROM BOOK_LENDING WHERE Date_Out BETWEEN "2017-01-01" AND "2017-06-30" GROUP BY Card_No HAVING COUNT(*)>3;

DELETE FROM BOOK WHERE Book_id="B201";

CREATE VIEW BOOKSS AS SELECT BOOK.Title,SUM(BOOK_COPIES.No_of_Copies) FROM BOOK,BOOK_COPIES WHERE BOOK.Book_id=BOOK_COPIES.Book_id GROUP BY BOOK.Title;
SELECT * FROM BOOKSS;

SELECT * , AVG(Pub_Year) OVER (PARTITION BY Pub_Year) FROM BOOK;