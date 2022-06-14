create database pgm2;
use pgm2;
create table student(
	sid int not null,
    sname varchar(20) not null,
    course varchar(20) not null,
    score int not null,
    category varchar(20));
    
insert into student values(201,"akku","mca",1450,"");
insert into student values(202,"makku","btech",991,"");
insert into student values(203,"ammu","bca",975,"");
insert into student values(204,"malu","mca",835,"");
    
call proc_grade(201,"akku","mca",1450);
call proc_grade(202,"makku","btech",991);
call proc_grade(203,"ammu","bca",975);
call proc_grade(204,"malu","mca",835);

select * from student;
