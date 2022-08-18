create table student(snum int PRIMARY KEY,
sname varchar(20),
major varchar(20),
level1 varchar(2),
age int
);

create table faculty(
fid INT PRIMARY KEY,
fname varchar(20),
deptid int
);

create table class(
cname varchar(20) PRIMARY KEY,
meetsat varchar(20),
room varchar(20),
d int,
foreign key (d) references faculty(fid)
);

create table enrolled(
snum int,
cname varchar(20),
primary key (snum, cname),
FOREIGN KEY (snum) REFERENCES student(snum),
FOREIGN KEY (cname) REFERENCES class(cname)
);

select sname from Student s,faculty f,enrolled e,class c where s.snum = e.snum and
e.cname = c.name and c.d = f.fid and s.level1 = 'JR' and f.fname = 'Harshith';

select name from class where room = 'R128' UNION (select cname from enrolled group
by cname having count(*) >= 5);

 select distinct f.fname from faculty f where 5 > (select count(e.snum) from class
c,enrolled e where c.name = e.cname and f.fid = c.d);