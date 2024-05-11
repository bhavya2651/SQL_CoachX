/********************Task -1**********************/

/*1. Create University Database give any University name you want*/

create database Panjab_University

/*2. 2. Under this University Create four tables and each table should have following 
three Column named as:-*/

use Panjab_University

/*Table-1*/

create table college_table (College_ID int not null primary key,
College_Name varchar(50) not null,
College_Area float not null)

/*Table-2*/
/*3. Apply foreign key on Department key from College_table */
create table Department_Table (Dept_ID int not null primary key,
Dept_Name varchar(20) not null,
Dept_Facility varchar(30) not null,
foreign key(dept_id) references college_table(college_id))

/*Table-3*/

create table Professor_Table(Professor_ID int not null primary key,
Professor_Name varchar(30) not null,
Professor_Subject varchar(20) not null)

/*Table-4*/
/*4. Apply foreign Key on Student_Table from Professor_Table*/
create table Student_Table(Student_ID int not null primary key,
Student_Name varchar(30),
Student_Stream varchar(20),
foreign key (student_id) references Professor_Table(Professor_ID))

/*5. Insert atleast 10 Records in each table */
SELECT * FROM college_table

insert into college_table 
values
(1,'DAV College',45),
(2,'MCM',50),
(3,'GAMC',78),
(4,'Jyoti B.Ed.',65),
(5,'CCA',54),
(6,'GCCBA',47),
(7,'NINE',30),
(8,'PGGC',63),
(9,'BAM',76),
(10,'Khalsa College',53);

select * from Department_Table

insert into Department_Table   
values
(1,'Mathematics','Study Room'),
(2,'Computer Science','Computer Lab'),
(3,'Biology','Research Lab'),
(4,'Physics','Observatory'),
(5,'Chemistry','Chemical Storage'),
(6,'History','Recording Studio'),
(7,'Psychology','Therapy Rooms'),
(8,'Economics','Simulation Labs'),
(9,'English','Library'),
(10,'Engineering','Automation Labs');

select * from [dbo].[Professor_Table]
insert into [dbo].[Professor_Table]
values
(1,'Mathew','Maths'),
(2,'Vineet','Computer'),
(3,'Vijay','Bio'),
(4,'Nishant','Physics'),
(5,'Rashmi','Chemistry'),
(6,'Priyanka','History'),
(7,'Aman','Psychology'),
(8,'Gaurav','Economics'),
(9,'Ashu','English'),
(10,'Varun','Pyhton');

insert into Student_Table
values
(1,'Sarthak','Maths'),
(2,'Advait','Computer'),
(3,'Rahul','Bio'),
(4,'Khyati','Physics'),
(5,'Akshita','Chemistry'),
(6,'Raman','History'),
(7,'Yogesh','Psychology'),
(8,'Aadesh','Economics'),
(9,'Lavanya','English'),
(10,'Saumya','Python');

select * from Student_Table


/********************Task -2**********************/

/*1. Give the information of College_ID and College_name from College_Table */

select college_id,college_name from [dbo].[college_table];

/*2. Show  Top 5 rows from Student table.*/

select top 5 * from Student_Table

/*3. What is the name of  professor  whose ID  is 5*/

select [Professor_Name] from [dbo].[Professor_Table]
where [Professor_ID] = 5;

/*4.Convert the name of the Professor into Upper case */

select upper([Professor_Name]) as uppercase_name from [dbo].[Professor_Table];

/*5.Show me the names of those students whose name is start with a*/

select [Student_Name] from [dbo].[Student_Table]
where [Student_Name] like 'a%';

/*6. Give the name of those colleges whose end with a*/

select [College_Name] from [dbo].[college_table]
where [College_Name] like '%a';

/*7. Add one Salary Column in Professor_Table*/

alter table [dbo].[Professor_Table]
add Salary int;

update [dbo].[Professor_Table] set
salary=
case
when [Professor_ID]=1 then 70000
when [Professor_ID]=2 then 80000
when [Professor_ID]=3 then 90000
when [Professor_ID]=4 then 100000
when [Professor_ID]=5 then 56000
when [Professor_ID]=6 then 89000
when [Professor_ID]=7 then 96000
when [Professor_ID]=8 then 74000
when [Professor_ID]=9 then 64000
when [Professor_ID]=10 then 55000
end;
select * from [dbo].[Professor_Table]

/*8. Add one Contact Column in Student_table*/

alter table [dbo].[Student_Table]
add Contact varchar(25);

update [dbo].[Student_Table] 
set
contact=
case 
when [Student_ID] =1 then 9546739674
when [Student_ID] =2 then 8546739674
when [Student_ID] =3 then 7546739674
when [Student_ID] =4 then 6546739674
when [Student_ID] =5 then 5546739674
when [Student_ID] =6 then 4546739674
when [Student_ID] =7 then 3546739674
when [Student_ID] =8 then 3546739674
when [Student_ID] =9 then 1546739674
when [Student_ID] =10 then 9946739674
end;
select * from [dbo].[Student_Table]


/*Q-9 Find the total Salary of Professor  */

select sum([Salary]) from [dbo].[Professor_Table]

/*Q-10 Change datatype of any one column of any one Table */

alter table [dbo].[Student_Table]
alter column [Contact] bigint;

select * from [dbo].[Student_Table]

/********************Task -3**********************/

/*1. Show first 5 records from Students table and Professor table Combine */

select top 5 * from [dbo].[Student_Table] as a
join
[dbo].[Professor_Table] as b
on a.Student_ID=b.Professor_ID;

/*2. Apply Inner join on all 4 tables together*/

select * from [dbo].[college_table] as a
join
[dbo].[Department_Table] as b
on a.college_id=b.dept_id
join
[dbo].[Professor_Table] as c
on b.dept_id=c.professor_id
join
[dbo].[Student_Table] as d
on c.professor_id=d.student_id

/*3. Show Some null values from Department table and Professor table.*/  

select * from [dbo].[Department_Table] as a
left join
[dbo].[Professor_Table] as b
on a.Dept_ID=b.Professor_ID

/*4.Create a View from College Table  and give those records whose college name starts with C*/
create view college_name_c as 
select college_name from [dbo].[college_tables_data]
where college_name like 'c%';

select * from college_name_c

/*5. Create Stored Procedure  of Professor table whatever professor ID will be given by user it should show whole records of it. */
CREATE procedure usp_professor
(@professor_id int)
as
begin
select * from [dbo].[Professor_Table]
where [Professor_ID]=@professor_id;
end;

exec usp_professor 2;

/*6. Rename the College_Table to College_Tables_Data .*/

exec sp_rename '[dbo].[college_table]','college_tables_data';


























