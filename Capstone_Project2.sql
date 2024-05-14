CREATE DATABASE Customers_Orders_Products 

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com'),
  (11, 'Alex Brown', 'alexbrown@example.com'),
  (12, 'Sophie Turner', 'sophieturner@example.com'),
  (13, 'Charlie Miller', 'charliemiller@example.com'),
  (14, 'Ava Wilson', 'avawilson@example.com'),
  (15, 'Daniel Harris', 'danielharris@example.com'),
  (16, 'Emma Davis', 'emmadavis@example.com'),
  (17, 'James White', 'jameswhite@example.com'),
  (18, 'Lily Martin', 'lilymartin@example.com'),
  (19, 'Benjamin Johnson', 'benjaminjohnson@example.com'),
  (20, 'Zoe Anderson', 'zoeanderson@example.com'),
  (21, 'Jackson Moore', 'jacksonmoore@example.com'),
  (22, 'Victoria Lewis', 'victorialewis@example.com'),
  (23, 'Ethan Garcia', 'ethangarcia@example.com'),
  (24, 'Grace Taylor', 'gracetaylor@example.com'),
  (25, 'Christopher Hall', 'christopherhall@example.com');


CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1),
  (11, 11, 'Product D', '2023-07-11', 2),
  (12, 12, 'Product E', '2023-07-12', 3),
  (13, 13, 'Product F', '2023-07-13', 4),
  (14, 14, 'Product G', '2023-07-14', 1),
  (15, 15, 'Product H', '2023-07-15', 5),
  (16, 16, 'Product I', '2023-07-16', 2),
  (17, 17, 'Product J', '2023-07-17', 3),
  (18, 18, 'Product A', '2023-07-18', 4),
  (19, 19, 'Product B', '2023-07-19', 2),
  (20, 20, 'Product C', '2023-07-20', 1),
  (21, 21, 'Product D', '2023-07-21', 3),
  (22, 22, 'Product E', '2023-07-22', 5),
  (23, 23, 'Product F', '2023-07-23', 2),
  (24, 24, 'Product G', '2023-07-24', 1),
  (25, 25, 'Product H', '2023-07-25', 4);





CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99),
  (11, 'Product K', 15.99),
  (12, 'Product L', 9.99),
  (13, 'Product M', 6.49),
  (14, 'Product N', 11.49),
  (15, 'Product O', 8.99),
  (16, 'Product P', 7.49),
  (17, 'Product Q', 10.99),
  (18, 'Product R', 13.99),
  (19, 'Product S', 16.49),
  (20, 'Product T', 5.49),
  (21, 'Product U', 14.99),
  (22, 'Product V', 8.49),
  (23, 'Product W', 9.99),
  (24, 'Product X', 12.49),
  (25, 'Product Y', 4.99);


  /**************Task 1 :-*******************/


 /* 1.	Write a query to retrieve all records from the Customers table.*/
 SELECT * FROM [dbo].[Customers];

 /*2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.*/
 SELECT [Name],[Email] FROM [dbo].[Customers]
 WHERE [Name] LIKE 'J%';

/*3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders.*/
   SELECT OrderID, ProductName,Quantity FROM [dbo].[Orders];

--4.	Write a query to calculate the total quantity of products ordered.
        SELECT COUNT([OrderID]) FROM [dbo].[Orders];   /*25*/

--5.	Write a query to retrieve the names of customers who have placed an order.
        SELECT a.[Name] from [dbo].[Customers] as a
		inner join
[dbo].[Orders] as b
on 
a.CustomerID=b.CustomerID;

--6.	Write a query to retrieve the products with a price greater than $10.00.
select [ProductName] from [dbo].[Products]
where [Price]>10.00;

--7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
select a.[Name], b.[OrderDate] from [dbo].[Customers] as a
join
[dbo].[Orders] as b
on a.CustomerID=b.CustomerID
where b.OrderDate>= '2023-07-05';

--8.	Write a query to calculate the average price of all products.
select [ProductName], avg([Price]) as average_price
from [dbo].[Products]
group by [ProductName];

--9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.
select a.[Name], b.[Quantity] from [dbo].[Customers] as a
join
[dbo].[Orders] as b
on a.CustomerID=b.CustomerID;

--10.	Write a query to retrieve the products that have not been ordered.
select [ProductName] from [dbo].[Products]
where [ProductName] not in (select [ProductName] from [dbo].[Orders]);

/********************Task 2***************/

--1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
select top 5 a.[Name], b.[Quantity] 
from [dbo].[Customers] as a
join [dbo].[Orders] as b
on a.CustomerID=b.CustomerID
order by Quantity desc

--2.	Write a query to calculate the average price of products for each product category.
select [ProductName], avg([Price]) as average_price
from [dbo].[Products]
group by [ProductName]

--3.	Write a query to retrieve the customers who have not placed any orders.
select a.[Name] from [dbo].[Customers] as a
left join [dbo].[Orders] as b
on a.CustomerID=b.CustomerID
where b.CustomerID is null;

--4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers 
--whose names start with 'M'.
select a.[Name],b.[OrderID],b.[ProductName],b.[Quantity] from [dbo].[Customers] as a
join
[dbo].[Orders] as b
on a.CustomerID=b.CustomerID
where a.Name like 'M%';

--5.	Write a query to calculate the total revenue generated from all orders.
SELECT sum(a.Quantity*b.price) as revenue from [dbo].[Orders] as a
join
[dbo].[Products] as b
on a.ProductName=b.ProductName    /*656.30*/

--6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.
select a.[Name], b.[Quantity]*c.[Price] as revenue from
[dbo].[Customers] as a
join
[dbo].[Orders] as b
on a.CustomerID=b.CustomerID
join
[dbo].[Products] as c
on
b.ProductName=c.ProductName;

--7.	Write a query to retrieve the customers who have placed at least one order for each product category. 
select a.[Name] from [dbo].[Customers] as a
join
[dbo].[Orders] as b
on a.CustomerID=b.CustomerID
JOIN
[dbo].[Products] as c
ON b.ProductName=c.ProductName;


--8.	Write a query to retrieve the customers who have placed orders on consecutive days. 
SELECT c.Name FROM Customers c INNER JOIN Orders o1 ON c.CustomerID = o1.CustomerID INNER JOIN Orders o2 ON c.CustomerID = o2.CustomerID WHERE DATEDIFF(DAY, o1.OrderDate, o2.OrderDate) = 1;
--9.	Write a query to retrieve the top 3 products with the highest average quantity ordered.
select top 3 [ProductName], avg([Quantity]) as avg_qty
from [dbo].[Orders]
group by [ProductName]
order by avg_qty desc;

--10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
select 
    (count(case when [Quantity] > avg_qty then 1 end) * 100.00)/count([Quantity]) as percentage_order
from [dbo].[Orders],
(select avg([Quantity]) as avg_qty from [dbo].[Orders]) as avg_table;

---------------------------Task 3:----------------------------------
--1.	Write a query to retrieve the customers who have placed orders for all products.
select a.[Name] from [dbo].[Customers] as a
join
[dbo].[Orders] as b
on
a.CustomerID=b.CustomerID
group by a.[Name]
having count (distinct b.ProductName)=(
select count(distinct [ProductName])
from [dbo].[Products]);

--2.	Write a query to retrieve the products that have been ordered by all customers.
select b.[ProductName] from [dbo].[Customers] as a
join
[dbo].[Orders] as b
on
a.CustomerID=b.CustomerID
group by b.ProductName
having count(distinct b.CustomerID)= (select count(distinct CustomerID) from [dbo].[Customers])
;

--3.	Write a query to calculate the total revenue generated from orders placed in each month.
        select month(a.orderdate) as order_date_month, sum(a.[Quantity]*b.[Price]) as revenue from [dbo].[Orders] as a
		join
[dbo].[Products] as b
on a.ProductName=b.ProductName
group by month(a.orderdate)

--4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.
select * from Orders
select a.[ProductName] from [dbo].[Orders] as a
join
[dbo].[Customers] as b
on a.CustomerID=b.CustomerID
group by a.ProductName
having count(distinct b.customerid)> (select 0.5*count(distinct(customerid)) from [dbo].[Customers]);

--5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
select top 5 a.[Name], b.[Quantity]*c.[Price] as money_spent from
[dbo].[Customers] as a
join
[dbo].[Orders] as b
on a.CustomerID=b.CustomerID
join
[dbo].[Products] as c
on
b.ProductName=c.ProductName
order by money_spent desc;

