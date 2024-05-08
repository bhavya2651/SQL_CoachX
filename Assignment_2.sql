/*Assignment 2*/

/* Q-1 Create DATABASE named as Order_Stores_Data*/

create database order_stores_data;

/*Q-2 Create 2 tables named as Orders_Table and Stores_Table*/

use order_stores_data

create table orders_table(OrderDate varchar(50),
Region varchar(15),
Rep varchar(20),
Order_Item varchar(20),
Units int,
Unit_Cost float,
Total_Price float,
Order_Id int)


create table stores_table(Store_Id int,
StoreType char,
Assortment int,
CompetitionDistance int,
Month_1 int,
Year_1 int,
PromoInterval varchar(20))

/*Q-3 Insert all records present in the Orders_Table and Stores_Table*/

/*Records have been added*/

/*Q-4 Make Order_ID  as Primary Key*/

alter table orders_table
alter column order_id int not null;

alter table orders_table
add constraint order_id Primary Key(order_id);

/*Q-5 Add one column as Store_Names and insert the records given above in Stores Table*/

alter table stores_table
add store_names varchar(50)

select * from stores_table

update stores_table set store_names=
case
when store_id=1 then 'Car'
when store_id=2 then 'Bikes'
when store_id=3 then 'Hardware'
when store_id=4 then 'Electrics'
when store_id=5 then 'Fibers'
when store_id=6 then 'Elastics'
when store_id=7 then 'Books'
when store_id=8 then 'Shoes'
when store_id=9 then 'Clothes'
when store_id=10 then 'Scraps'
end


/*Q-6 Make store_id as a foreign key with reference to orders table*/  
alter table stores_table
add constraint store_id foreign key (store_id) references orders_table(order_id)


/*Q-7 Update the missing records in the Order_Item column in Order_Table missing records are given in this sheet*/

select * from orders_table

update orders_table
set 
Order_Item=
case
when order_id=3 then 'Compass'
when order_id=4 then 'Torch'
when order_id=5 then 'Phone'
when order_id=7 then 'Laptop'
when order_id=9 then 'Box'
end
where order_item = ' ';

/*Q-8 Update the missing records in the PromoInterval column in Stores table*/

select * from stores_table

update stores_table
set
PromoInterval=
case
when store_id=4 then 'Apr'
when store_id=7 then 'July'
when store_id=9 then 'Sep'
end
where PromoInterval = ' ';

/*Q-9 Rename the column of Assortment to store_nos in stores_table*/

select * from stores_table
exec sp_rename 'stores_table.assortment','store_nos','COLUMN';

/*Q-10 Rename the column name of Order_Item to Item_Name and Rep column  as Customers_Name in orders_table*/

select * from orders_table

exec sp_rename 'orders_table.Order_Item','Item_Name','COLUMN';
exec sp_rename 'orders_table.rep','Customers_Name','COLUMN';

/*Q-11 Sort the Unit_cost of orders_table in descending order and total price column in ascending order*/
select * from orders_table
select *
from
orders_table
order by Unit_Cost desc, Total_Price asc;

/*Q-12 Convert Customer_name to Cus_Name and find out how many cus_name in each region*/

exec sp_rename 'orders_table.Customers_Name','Cus_Name','COLUMN'
SELECT * FROM orders_table

select region as region,count(cus_name) as count_cus_name from orders_table
group by region;

/*Q-13 Find the sum of Total_Price column and unit cost in orders_table*/

select * from orders_table

select sum(total_price) as sum_total_price, sum(unit_cost) as sum_unit_cost 
from
orders_table;

/*Q-14 Show orderdate, unit cost,store type and year in one table  and name that table as  orders_store_table*/

select * from orders_table
select * from stores_table


select a.orderdate, a.unit_cost, b.storetype,b.year_1 
into orders_store_table
from
orders_table as a
left join
stores_table as b
on a.Order_Id=b.Store_Id

select * from orders_store_table

/*Q-15 Display order_item and region whose order_id is 4,5,6,9*/

select * from orders_table

select item_name,region from orders_table
where order_id in (4,5,6,9);

/*Q-16 Show year whose competitiondistance is 29910,310,3160*/

select * from stores_table
select year_1 from stores_table
where CompetitionDistance in (29910,310,3160)

/*Q-17 Give me the Item_Name whose total_price is greater  than 200 and less than 400*/
select * from orders_table
select item_name from orders_table
where total_price>200 and Total_Price<400

/*Q-18 Rename the Competition Distance as CD and find the total CD in Stores_table*/
select * from stores_table
exec sp_rename 'stores_table.competitiondistance','cd','COLUMN'
select sum(cd) from stores_table

/*Q-19 What is the Total count of stores_type and cd_columns*/

select * from stores_table
select count(storetype) as total_rec, count(distinct storetype) as unik_rec , count(cd) as count_cd
from stores_table

/*Q-20 Apply the CROSS JOIN in Orders_TABLE and Stores_Table*/

select a.*,b.* from stores_table as a
cross join
orders_table b

/*Q-21 Drop both the tables*/

drop table orders_table
drop table stores_table














