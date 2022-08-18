create table Branch (
Br_Name varchar(20) primary key,
Br_City varchar(20),
Assets number(10,2)
);

create table Accounts (
Accno number (3) primary key,
Br_Name varchar(20),
Balance number(10,2),
constraint FK1 foreign key (Br_Name) references Branch(Br_Name)
);

create table Customer (
C_Name varchar(20) primary key,
C_Street varchar(20),
C_City varchar(20)
);

create table Depositor (
C_Name varchar(20),
Accno number(3),
primary key (C_Name,Accno),
constraint FK2 foreign key (C_Name) references Customer(C_Name),
constraint FK3 foreign key (Accno) references Accounts(Accno) on delete cascade
);

create table Loan (
Loan_No number(8) primary key,
Br_Name varchar(20),
Amount number(10,2),
constraint FK4 foreign key (Br_Name) references Branch(Br_Name)
);

create table Borrower (
C_Name varchar(20),
Loan_No number(8),
constraint FK5 foreign key (C_Name) references Customer(C_Name),
constraint FK6 foreign key (Loan_No) references Loan(Loan_No)
);

select Customer_Name from Depositor where Accno in (select Accno from Depositor where Accno in (select Accno from Accounts where Branch_Name in(select Branch_Name from Accounts where Branch_Name="Nagarbhavi" group by Branch_Name having count(*) > 1))) group by Customer_Name having count(*) > 1;

select Customer_Name  from Branch b, Accounts a,Depositor d where b.Branch_Name=a.Branch_Name and a.Accno=d.Accno and b.Branch_City='Bengaluru' group by Customer_Name having count(distinct b.Branch_Name)=( select count(Branch_Name) from Branch where Branch_City='Bengaluru');

delete from Accounts where Branch_Name in (select Branch_Name from Branch where Branch_City='&City');
