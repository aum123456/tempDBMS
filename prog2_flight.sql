create table Flights (
no number(3) primary key,
from_1 varchar(15),
to_1 varchar(15),
distance number(6),
departs varchar(10),
arrives varchar(10),
price number(10,2)
);

create table Aircraft (
aid number(3) primary key,
aname varchar(15),
cruising_range number(5)
);

create table Employee (
eid number(3) primary key,
ename varchar(15),
salary number(10)
);

create table Certified (
eid number(3),
aid number(3),
primary key(eid,aid),
constraint FK1 foreign key(eid) references Employee(eid),
constraint FK2 foreign key(aid) references Aircraft(aid)
);

select distinct (a.aname) from Aircraft a where a.aid in (select c.aid from Certified c,Employee e where c.eid = e.eid and e.salary>80000);

select c.eid,max(a.cruising_range) from Certified c,Aircraft a where c.aid = a.aid group by c.eid having count(c.eid)>3;

select ename from Employee where salary < (select min(price) from Flights where from_1='Bengaluru' and to_1='Frankfurt');
