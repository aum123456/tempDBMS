create table Author (
aid number(5) primary key,
a_name varchar(25),
a_city varchar(15),
a_country varchar(15)
);

create table Publisher (
pid number(5) primary key,
p_name varchar(25),
p_city varchar(15),
p_country varchar(15)
);

create table Category (
cid number(5) primary key,
description varchar(10)
);

create table Catalog (
bid number(5) primary key,
title varchar(25),
aid number(5),
pid int(5),
cid number(5),
price number(4),
year number(4),
constraint FK1 foreign key(aid) references Author(aid),constraint FK2 foreign key(pid) references Publisher(pid),constraint FK3 foreign key(cid) references Category(cid)
);

create table Order_Details (
o_no number(5) foreign key,
bid number(5),
quantity number(4),
constraint FK4 foreign key(bid) references Catalog(bid)
);

select * from Author a where a.aid in (select c.aid from Catalog c,Author a1,Publisher p where c.aid = a1.aid and p.pid = c.pid and c.price > (select avg(price) from Catalog) and c.year > 2000 group by c.aid having count(*) >= 2);

select distinct(a.a_name) from Author a,Catalog c,Order_Details o where a.aid = c.aid and c.bid = o.bid and o.bid in (select o1.bid from Order_Details o1 group by o1.bid having sum(quantity) = (select max(sum(quantity)) from Order_Details group by bid));

select c.bid,c.title,c.price,c.price*1.1 from Catalog c,Publisher p where c.pid = p.pid and p.p_name = '&p_name';
