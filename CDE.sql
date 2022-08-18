---------------------PROG1: STUDENT---------------------

select sname from Student s,faculty f,enrolled e,class c where s.snum = e.snum and
e.cname = c.name and c.d = f.fid and s.level1 = 'JR' and f.fname = 'Harshith';

select name from class where room = 'R128' UNION (select cname from enrolled group
by cname having count(*) >= 5);

 select distinct f.fname from faculty f where 5 > (select count(e.snum) from class
c,enrolled e where c.name = e.cname and f.fid = c.d);

------------------------------------------PROG2: FLIGHT------------------------------------------

select distinct (a.aname) from Aircraft a where a.aid in (select c.aid from Certified c,Employee e where c.eid = e.eid and e.salary>80000);

select c.eid,max(a.cruising_range) from Certified c,Aircraft a where c.aid = a.aid group by c.eid having count(c.eid)>3;

select ename from Employee where salary < (select min(price) from Flights where from_1='Bengaluru' and to_1='Frankfurt');

---------------------PROG3: BOOK DEALER---------------------

select * from Author a where a.aid in (select c.aid from Catalog c,Author a1,Publisher p where c.aid = a1.aid and p.pid = c.pid and c.price > (select avg(price) from Catalog) and c.year > 2000 group by c.aid having count(*) >= 2);

select distinct(a.a_name) from Author a,Catalog c,Order_Details o where a.aid = c.aid and c.bid = o.bid and o.bid in (select o1.bid from Order_Details o1 group by o1.bid having sum(quantity) = (select max(sum(quantity)) from Order_Details group by bid));

select c.bid,c.title,c.price,c.price*1.1 from Catalog c,Publisher p where c.pid = p.pid and p.p_name = '&p_name';

---------------------PROG4: BANKING ENTERPRISE---------------------

select Customer_Name from Depositor where Accno in (select Accno from Depositor where Accno in (select Accno from Accounts where Branch_Name in(select Branch_Name from Accounts where Branch_Name="Nagarbhavi" group by Branch_Name having count(*) > 1))) group by Customer_Name having count(*) > 1;

select Customer_Name  from Branch b, Accounts a,Depositor d where b.Branch_Name=a.Branch_Name and a.Accno=d.Accno and b.Branch_City='Bengaluru' group by Customer_Name having count(distinct b.Branch_Name)=( select count(Branch_Name) from Branch where Branch_City='Bengaluru');

delete from Accounts where Branch_Name in (select Branch_Name from Branch where Branch_City='&City');

---------------------PROG5: ORDER PROCESSING----------------------------

SELECT C.CID, C.CNAME, COUNT(*) AS NO_OF_ORDERS, AVG(OI.QTY*I.UNIT_PRICE) FROM CUST C, ORDERS OT, ITEM I, ORDER_ITEM OI WHERE C.CID=OT.CID AND OT.ONO=OI.ONO AND OI.INO=I.INO GROUP BY (C.CID, C.CNAME);
 
SELECT S.ONO FROM SHIPMENT S, WAREHOUSE W WHERE S.WARENO=W.WARENO AND W.CITY='BANGALORE';


DELETE FROM ITEM WHERE INO=10;
UPDATE ORDER_ITEM SET INO=NULL WHERE INO=10;