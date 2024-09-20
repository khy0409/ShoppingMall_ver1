create user shopping identified by 1234;
grant DBA, Resource, Connect to shopping;

--TABLES--
--Seller
create table Seller(
SellerKey varchar2(15) primary key, --Primary key
BusinessNum varchar2(12) unique not null, --Unique, Not Null
SellerId varchar2(30) unique not null, --Unique, Not Null
SellerPw varchar2(20) not null, --Not Null
Email varchar2(30) not null, --Not Null
Tell varchar2(16) not null --Not Null
);

--Shop
create table Shop(
ShopId varchar2(15) primary key, --Primary key
ShopNm varchar2(30),
ShopDetail varchar2(50),
ProfileImg varchar2(255),
SellerKey varchar2(15), --Foreign key
foreign key (SellerKey) references Seller(SellerKey) on delete cascade
);

--Buyer
create table Buyer(
BuyerId varchar2(15) primary key, --Primary key
BuyerNick varchar2(10) unique, --Unique
BuyerPw varchar2(20),
Email varchar2(30) unique, --Unique
Tell varchar2(16) unique, --Unique
Point int,
Grade varchar2(15) default 'Bronze' --(Diamond(15), Gold(10), Silver(5), Bronze(Default))
);


--Product
create table Product(
ProductNum int primary key, --Sequences
ProductNm varchar2(30) not null, --Not Null
ProductDetail clob,
Summary varchar2(50),
Price int not null, --Not null
Sale decimal(4, 1),
ShopId varchar2(15) not null, --Not Null
Category char(20) not null, --Not Null
Rdate date default sysdate, --Rdate, Default sysdate
Ddate date,
foreign key (ShopId) references Shop(ShopId) on delete cascade
);

--ProductIMG
create table ProductIMG(
ImageNum int, --Sequences
ProductNum int, --Foreign key
ImageURL varchar2(255),
IsPrimary char(1) default 'N', --IsPrimary, Default 'N'
primary key(ImageNum, ProductNum)
);

--OrderList
create table OrderList(
OrderId varchar2(13) primary key, --Primary key
OrderDate date default sysdate, --OrderDate, Default sysdate
BuyerId varchar2(15), --Foreign key
TotalCnt int,
TotalPrice int,
foreign key (BuyerId) references Buyer(BuyerId) on delete cascade
);

--OrderItem
create table OrderItem(
ItemId varchar2(10) primary key, --Primary key
OrderId varchar2(13), --Foreign key
ProductNum int, --Foreign key
Cnt int,
Price int,
ShopId varchar2(15), --Foreign key
Status char(1) default 'N' not null, --OrderStatus, Default 'N'
foreign key (OrderId) references OrderList(OrderId) on delete cascade,
foreign key (ProductNum) references Product(ProductNum) on delete cascade,
foreign key (ShopId) references Shop(ShopId) on delete cascade
);

--Reviews
create table Review(
ReviewNum int primary key, --Primary key
Review clob,
ProductNum int, --Foreign key
BuyerId varchar2(15), --Foreign key
ShopId varchar2(15), --Foreign key
scope int,
foreign key (ProductNum) references Product(ProductNum) on delete cascade,
foreign key (BuyerId) references Buyer(BuyerId) on delete cascade,
foreign key (ShopId) references Shop(ShopId) on delete cascade
);

--Wish List, Not Primary key
create table Wish(
BuyerId varchar2(15),
ProductNum int,
foreign key (BuyerId) references Buyer(BuyerId) on delete cascade,
foreign key (ProductNum) references Product(ProductNum) on delete cascade
);