create table Customer (
cid number(5) primary key,
cname varchar(20),
c_city varchar(20)
);

create table Orders (
o_no number(5) primary key,
o_date date,
cid number(5),
ord_amt number(5),
constraint FK1 foreign key (cid) references Customer (cid)
);

create table Item (
i_no number(5) primary key,
unit_price nmber(5)
);

create table Order_Item (
o_no number (5),
i_no number(5),
qty number (5),
primary key (o_no,i_no),
constraint FK2 foreign key (o_no) references Orders(o_no),
constraint FK3 foreign key (i_no) references Item (i_no) on delete cascade
);

create table Warehouse (
ware_no number (5) primary key,
w_city varchar(20)
);

create table Shipment (
o_no number(5),
ware_no number(5),
ship_date date,
primary key (o_no,ware_no),
constraint FK4 foreign key (o_no) references Orders(o_no),
constraint FK5 foreign key (ware_no) references Warehouse (ware_no)
);

SELECT C.CID, C.CNAME, COUNT(*) AS NO_OF_ORDERS, AVG(OI.QTY*I.UNIT_PRICE) FROM CUST C, ORDERS OT, ITEM I, ORDER_ITEM OI WHERE C.CID=OT.CID AND OT.ONO=OI.ONO AND OI.INO=I.INO GROUP BY (C.CID, C.CNAME);
 
SELECT S.ONO FROM SHIPMENT S, WAREHOUSE W WHERE S.WARENO=W.WARENO AND W.CITY='BANGALORE';


DELETE FROM ITEM WHERE INO=10;
UPDATE ORDER_ITEM SET INO=NULL WHERE INO=10;
