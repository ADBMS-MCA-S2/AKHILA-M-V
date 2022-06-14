create database customersale;

use customersale;

create table customer(
	custid int not null,
    custname varchar(20) not null,
    primary key(custid));
    
create table item(
	itemid int not null,
    itemname varchar(20) not null,
    price int not null,
    primary key(itemid));
    
create table sale(
	billno int not null,
    billdate date not null,
    custid int not null,
    itemid int not null,
    qtysold int not null,
    primary key(billno),
    foreign key(custid) references customer(custid) on delete cascade on update cascade,
    foreign key(itemid) references item(itemid) on delete cascade on update cascade);
    
insert into customer values(1,"akku");
insert into customer values(2,"makku");
insert into customer values(3,"raju");
insert into customer values(4,"ammu");
insert into customer values(5,"rahul");

insert into item values(101,"bag",350);
insert into item values(102,"can",290);
insert into item values(103,"pen",10);
insert into item values(104,"book",50);
insert into item values(105,"sandal",250);

insert into sale values(2001,"2022-06-13",1,101,1);
insert into sale values(2002,"2022-06-14",1,103,5);
insert into sale values(2003,"2022-06-14",2,102,1);
insert into sale values(2004,"2022-06-12",3,104,3);
insert into sale values(2005,"2022-06-13",2,105,1);
insert into sale values(2006,"2022-06-12",4,101,1);
insert into sale values(2007,"2022-06-11",5,104,2);
insert into sale values(2008,"2022-06-10",1,105,1);
insert into sale values(2009,"2022-06-11",5,105,1);

select sale.itemid,customer.custname
	from sale,customer,item 
	where sale.billdate="2022-06-14" and sale.custid=customer.custid and sale.itemid=item.itemid;
    
select sale.billno,item.itemname,item.price,sale.qtysold,(item.price * sale.qtysold) as total 
	from sale,item 
    where sale.itemid=item.itemid;
    
select customer.custid,customer.custname,item.itemname,item.price from customer,item,sale
	where item.price>200 and customer.custid=sale.custid and item.itemid=sale.itemid;
    
select customer.custname, count(item.itemname) as num_of_prdct_bought from customer,item,sale
	where customer.custid=sale.custid and item.itemid=sale.itemid group by sale.custid;
    
select item.itemname from item,sale where sale.custid=5 and item.itemid=sale.itemid;
