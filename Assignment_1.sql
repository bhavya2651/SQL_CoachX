                            /*Basic Questions*/

/* Q-1 Create 2 databases Name: Brands and Produts*/

create database brands
create database products

/*Q-2 Create 2 tables in SQL server name as ITEMS_TABLE in BRANDS database and PRODUCT_TABLE in PRODUCTS database*/
use brands
create table ITEMS_TABLE (Item_Id int,	item_description varchar(50),	vendor_nos int,	vendor_name varchar(50),
bottle_size int,	bottle_price float)

use products
create table PRODUCT_TABLE (Product_Id int,
Country	varchar(20),
Product varchar(20),
Units_Sold float,
Manufacturing_Price float,
Sale_Price float,
Gross_Sales float,
Sales float,
COGS float,
Profit float,
Date_1 varchar(20),
Month_Number int,
Month_Name varchar(20),
Year_1 varchar(20))

/*Q-3 After creating both the tables add records in that table*/
/*Rows have been added*/

/*Q-4 Delete those products having the units sold 1618.5,888 and 2470*/
use products
select * from product_table /* 8 rows*/
select * from product_table where units_sold in (1618.5,888,2470)   /*there are 3 records*/
delete from PRODUCT_TABLE where Units_Sold in (1618.5,888,2470)     /*3 rows affected*/
select * from product_table /*5 records*/

/*Q-5 Drop the table and create it again*/
use products
drop table PRODUCT_TABLE

create table PRODUCT_TABLE (Product_Id int,
Country	varchar(20),
Product varchar(20),
Units_Sold float,
Manufacturing_Price float,
Sale_Price float,
Gross_Sales float,
Sales float,
COGS float,
Profit float,
Date_1 varchar(20),
Month_Number int,
Month_Name varchar(20),
Year_1 varchar(20))

               /*Intermediate Questions*/
/*Big Table*/

/*Q-1 Find the total sale price and gross sales*/
select sum(sale_price) as total_sale_price, sum(gross_sales) as gross_sales from PRODUCT_TABLE;  /*sale_price=$ 462 and gross_sales=$ 715411*/

/*Q-2 In which year we have got the highest sales?*/

select year_1 from PRODUCT_TABLE
where sales=(select max(sales) from PRODUCT_TABLE);  /*Year=2019*/

/*Q-3 Which product having the sales of $37,050.00*/

select sales,product from PRODUCT_TABLE
where sales=37050;                            /* Product- Carretera*/

/*Q-4 Which countries lies between profit of $4,605 to $22,662.0*/

select country from PRODUCT_TABLE
where profit  between 4605 and 22662;       /*Canada
											Germany
											France
											Mexico
											Germany
											Canada*/

/*Q-5 Which Product ID has the sales of $24,700.0*/

select Product_Id from PRODUCT_TABLE
where sales=24700;    /*none of the product id has sales of $24,700*/

/*Small Table*/

/*Q-1 Find the item_description having the bottle size of 750*/

use brands

select item_description from ITEMS_TABLE
where bottle_size=750;

/*Travis Hasse Apple Pie
D'aristi Xtabentun
Oak Cross Whisky
Heaven Hill Old Style White Label
Hyde Herbal Liqueur
Dupont Calvados Fine Reserve*/

/*Q-2 Find the vendor name having the vendor_nos 305,380,391*/

select vendor_name from ITEMS_TABLE
where vendor_nos in (305,380,391);

/*Mhw Ltd
Anchor Distilling (preiss Imports)
Mhw Ltd
Phillips Beverage Company*/

/*Q-3 What is total bottle_price*/

select sum(bottle_price) from ITEMS_TABLE;    /*92.73*/

/*Q-4 Make Primary Key to item_id*/

alter table items_table
alter column item_id int not null;

alter table items_table
add constraint item_id primary key(item_id)

/*Q-5 Which item_id has bottle_price of $5.06*/

select item_id from ITEMS_TABLE
where bottle_price=5.06           /*Item_ID=7*/


                         /*Advanced Question*/

/*Q-1 Apply INNER, FULL OUTER, LEFT JOIN on both the table*/

/*Inner Join*/
select a.*,b.* from brands.dbo.ITEMS_TABLE as a
inner join
products.dbo.PRODUCT_TABLE as b
on a.item_id=b.product_id;

/*Full Outer*/
select c.*,d.* from products.dbo.PRODUCT_TABLE as c
full outer join
brands.dbo.items_table as d
on c.product_id=d.item_id

/*Left Join*/
select a.*,b.* from brands.dbo.ITEMS_TABLE as a
left join
products.dbo.PRODUCT_TABLE as b
on 
a.Item_Id=b.Product_Id


/*Q-2 Apply outer, right join and cross join on both the table*/

select a.*, b.* from products.dbo.PRODUCT_TABLE as a
join
brands.dbo.ITEMS_TABLE as b
on a.Product_Id=b.Item_Id

select a.*, b.* from products.dbo.PRODUCT_TABLE as a
right join
brands.dbo.ITEMS_TABLE as b
on a.Product_Id=b.Item_Id

select * from products.dbo.PRODUCT_TABLE
cross join
brands.dbo.ITEMS_TABLE

/*Q-3 Find the item_decription and Product having the gross sales of 13,320*/

select a.item_description,b.product from products.dbo.PRODUCT_TABLE as b
left join 
brands.dbo.ITEMS_TABLE as a
on
b.Product_Id=a.Item_Id
where gross_sales=13320;    /*Oak Cross Whisky	 Carretera */

/*Q-4 Split the ITEM_description column into columns Item_desc_1 and Item_desc_2*/
use brands
select * from ITEMS_TABLE

alter table items_table
add  item_desc_1 varchar(255), item_desc_2 varchar(255)

update ITEMS_TABLE
set 
item_desc_1=SUBSTRING(item_description,1,charindex(' ',item_description)-1),
item_desc_2=substring(item_description,charindex(' ',item_description)+1,len(item_description));

select * from ITEMS_TABLE



