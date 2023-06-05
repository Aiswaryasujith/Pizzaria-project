-----creating table customers
create table customers(cust_id int primary key not null,
customer_firtsname varchar(25),
customer_lastname varchar(25));

select * from customers

-----creating table address
create table address(address_id int primary key not null,delivery_address varchar(200),
delivery_address2 varchar(200), delivery_city varchar(50),
delivery_zipcode varchar(20));

select * from address;

-----creating table ingredients
Create table ingredients(ing_id int primary key not null, ing_name varchar(50), 
ing_weight int, ing_measure varchar(20), ingredient_price float);

select * from ingredients

-----creating table staff
Create table staff(staff_id int primary key not null, first_name varchar(50), 
last_name varchar(50), position varchar(50), hourly_rate float);

select * from staff;

-----creating table shift
Create table shift(shift_id int primary key not null, 
day_of_week varchar(20), start_time time, end_time time);

select * from shift;

-----creating table rotation
Create table rotation(id int primary key not null identity, rotation_id int, 
date datetime,shift_id int, staff_id int,
 foreign key(shift_id) references shift(shift_id),
 foreign key(staff_id) references staff(staff_id));

 select * from rotation;

 -----creating table receipe
 create table receipe(id int primary key not null identity,
 receipe_id int, ingredient_id int, quantity int,
 foreign key(ingredient_id) references ingredients(ing_id));

select * from receipe;

-----creating table item
create table item(item_id int primary key not null, receipe_id int, item_name varchar(50), 
item_category varchar(100), item_sixe varchar(10), item_price float);

select * from item

-----creating table orders
create table orders(row_id int primary key identity, order_id int, 
created_at datetime, item_id int, quantity int, cust_id int, delivery bit,
add_id int, foreign key(cust_id) references customers(cust_id), 
foreign key(item_id) references item(item_id),
foreign key(add_id) references address(address_id));

select * from orders

-----creating table inventory
Create table inventory(inventory_id int primary key not null, item_id int, quantity int,
foreign key(item_id) references item(item_id));

select * from inventory;
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
-------inserting to customers
insert into customers values(1001,'Aiswarya','Ravindran'),
(1002,'Ravindran','Krishanan'),
(1003,'usha','Govindan'),
(1004,'sujith kumar','Haridasan'),
(1005,'Vandhana','Vikram'),
(1006,'Rathi','Gautham');

select * from customers;

-------inserting to address
insert into address values(101,'1817, 18A st sw, calgary','1817, 17a st sw,calgary','Calgary','T2T4W1'),
(102,'1811, 19A st sw, Toronto','1811, 20A st sw, Toronto','Toronto','T2W4W1'),
(103,'1820, 20B st sw, Vancouver','1820, 21B st sw, Vancouver','Vancouver','T3T4W1'),
(104,'1912, 21A st sw, calgary','1912, 22A st sw, calgary','Calgary','T2T5W1'),
(105,'1933, 18B st sw, Toronto','1933, 19B st sw, Toronto','Toronto','T2T4H1'),
(106,'1856, 11A st sw, PittMeadows','1856, 12A st sw, PittMeadows','Vancouver','T2T4W2');

select * from address;

-------inserting to ingredients
insert into ingredients values(001,'pizza dough',2000,'grams',4.22),
(002,'Tomato sauce',4500,'grams',3.89),
(003,'Mozzarella cheese',2500,'grams',14.45),
(004,'Dried oregano',500,'grams',5.99),
(005,'Spicy salami',3500,'grams',37.64),
(006,'Eggplant',1000,'grams',1.90),
(007,'Parmesan cheese',2500,'grams',18.75),
(008,'Ricotta cheese',1500,'grams',3.99),
(009,'Tuna',2000,'grams',7.66),
(010,'Pepperoni',2500,'grams',24.18);

select * from ingredients;

-------inserting to staff
insert into staff values(1,'Sam','Mathew','host','15'),
(2,'Darvin','Thomas','host','15'),
(3,'Lilly','Sherin','Chef','35'),
(4,'Nayan','Thara','Co-chef','30'),
(5,'Kajal','Agarwal','Co-chef','30'),
(6,'Jennifer','Joesph','Order-taker','12.5'),
(7,'Jessy','Barbara','host','15'),
(8,'Andy','Chow','host','15'),
(9,'Marissa','Licoln','Order-taker','12.5'),
(10,'Steff','George','host','15'),
(11,'Deekey','Harry','host','15'),
(12,'Sahil','Mohammed','Co-chef','30'),
(13,'Joseph','Wick','Manager','29.8'),
(14,'John','Potter','Delivery-agent','14.5'),
(15,'Ben','Cooper','Delivery-agent','14.5');

select * from staff;

-------inserting to shift
insert into shift values(1,'Monday','9:00:00','6:00:00'),
(2,'Tuesday','9:00:00','3:00:00'),
(3,'Wednesday','9:00:00','6:00:00'),
(4,'Thursday','9:00:00','6:00:00'),
(5,'Friday','9:00:00','00:00:00');

select * from shift;

-------inserting to rotation
insert into rotation values(1,'2023-01-01',1,1),
(2,'2023-01-01',1,3),
(3,'2023-01-01',1,4),
(4,'2023-01-01',1,13),
(5,'2023-01-01',1,14),
(6,'2023-01-01',2,6),
(7,'2023-01-02',2,2),
(8,'2023-01-02',2,3),
(9,'2023-01-02',2,5),
(10,'2023-01-02',2,9),
(11,'2023-01-02',2,13),
(12,'2023-01-02',2,15),
(13,'2023-01-03',3,7),
(14,'2023-01-03',3,3),
(15,'2023-01-03',3,4),
(16,'2023-01-03',3,13),
(17,'2023-01-03',3,14),
(18,'2023-01-03',3,6),
(19,'2023-01-04',4,8),
(20,'2023-01-04',4,3),
(21,'2023-01-04',4,5),
(22,'2023-01-04',4,9),
(23,'2023-01-04',4,13),
(24,'2023-01-04',4,15);

select * from rotation;

-------inserting to receipe
insert into receipe values(1,001,5),
(1,003,3),
(1,005,1),
(1,009,2),
(2,002,2),
(2,007,6),
(2,004,4),
(3,008,4),
(3,004,8),
(3,001,2),
(3,006,1),
(3,003,1);

select * from receipe;

-------inserting to items
insert into items values(1,'2022-12-01','Cheese Burst','Single pizza','7ich',14.4),
(2,'2022-12-05','Cheese Burst-large','Family pizza','9ich',17),
(3,'2022-12-07','Parmesan cheese burst','Single pizza','7ich',16.2),
(4,'2022-12-09','Parmesan cheese burst','Family pizza','9ich',18.4),
(5,'2022-12-11','Egg-plant infused cheese burst','Single pizza','7ich',15.8),
(6,'2022-12-31','Egg-plant infused cheese burst','Family pizza','9ich',18);

select * from items;

-------inserting to orders
insert into orders values(1,'2023-02-01 09:00:00', 1,1,1001,1,101),
(2,'2023-02-01 09:05:00', 3,2,1001,1,101),
(3,'2023-02-02 14:00:00', 2,1,1002,1,102),
(4,'2023-02-05 07:11:00', 5,3,1003,1,103),
(5,'2023-01-07 10:00:00', 4,1,1004,0,104);

select * from orders;

-------inserting to inventory
insert into inventory values(1,1,4),
(2,2,2),
(3,3,0),
(4,4,6),
(5,5,2),
(6,6,0);

select * from inventory;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----Dashboard 1- Total orders, Total sales, Total items, average order value, sales by category, top selling items,order by hour, sales by hour, order by address, order by delivery/pickup
select o.order_id,i.item_id,o.quantity,i.item_category,i.item_name,o.created_at,
a.delivery_address,a.delivery_address2,a.delivery_city,a.delivery_zipcode, o.delivery
from orders as o left join item as i on o.item_id=i.item_id
left join address as a on o.add_id=a.address_id;

----Dashboard 2- Total quantity by ingredient, total cost of ingredients, calculated cost of pizza, percentage stock remaining by ingredient
create VIEW stock1 
AS
select s1.item_name, 
s1.ingredient_id,s1.ing_name,
s1.ing_weight,
s1.ingredient_price,
s1.receipe_quantity,
s1.order_quantity,
s1.order_quantity*s1.receipe_quantity as 'ordered_weight',
s1.ingredient_price/s1.ing_weight as 'unit cost',
(s1.order_quantity*s1.receipe_quantity)*(s1.ingredient_price/s1.ing_weight) as 'ingredient_cost'
from(
select o.item_id,
i.receipe_id,
i.item_name, 
r.ingredient_id,
ing.ing_name,
r.quantity as 'receipe_quantity',
SUM(o.quantity) as 'order_quantity ', 
ing.ing_weight, 
ing.ingredient_price
from orders as o 
left join item i on o.item_id=i.item_id
left join receipe as r on i.receipe_id=r.receipe_id
left join ingredients as ing on ing.ing_id=r.ingredient_id
GROUP by o.item_id,i.receipe_id,i.item_name,r.ingredient_id,r.quantity,ing.ing_name, ing.ing_weight,ing.ingredient_price)
as s1
GO

select * from stock1;---view display


create view stock2 as
select s2.ing_name,
s2.ordered_weight,
ing.ing_weight*inv.quantity as 'total_inv_weight',
(ing.ing_weight*inv.quantity)-s2.ordered_weight as 'remaining_weight'
from(
    select ingredient_id,ing_name, sum(ordered_weight) as 'ordered_weight'
    FROM
    stock1
    group by ing_name,ingredient_id) as s2
left join inventory as inv on inv.item_id=s2.ingredient_id
left join ingredients as ing on ing.ing_id=s2.ingredient_id
go

select * from stock2;---view display
