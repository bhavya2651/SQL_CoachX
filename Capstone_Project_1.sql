create database project_1_emp   
use project_1_emp

create table employee_detail (employee_id int not null primary key,
first_name varchar(25),
last_name varchar(25),
salary bigint,
joining_date datetime,
department varchar(20),
gender varchar(10));

select * from employee_detail

insert into [dbo].[employee_detail] values
(1,'Vikas','Ahlawat',600000,'2/12/2013 11:16','IT','MALE'),
(2,'Nikita','Jain',530000,'2/14/2013 11:16','HR','FEMALE'),
(3,'Ashish','Kumar',1000000,'2/14/2013 11:16','IT','MALE'),
(4,'Nikhil','Sharma','480000','2/15/2013 11:16','HR','MALE'),
(5,'Anish','Kadian','500000','2/16/2013 11:16','Paroll','MALE');


/*1) Write a query to get all employee detail from "EmployeeDetail" table */

SELECT * FROM [dbo].[employee_detail]

/*2) Write a query to get only "FirstName" column from "EmployeeDetail" table*/

SELECT [first_name] FROM [dbo].[employee_detail]

/*3) Write a query to get FirstName in upper case as "First Name"*/

SELECT UPPER([first_name]) AS First_Name from [dbo].[employee_detail]

/*4) Write a query to get FirstName in upper case as "First Name".*/

SELECT UPPER([first_name]) AS First_Name from [dbo].[employee_detail]

/*5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)*/

select CONCAT(first_name,' ',last_name) as name from [dbo].[employee_detail]

/*6. Select employee detail whose name is "Vikas */

select * from [dbo].[employee_detail]
where first_name = ('Vikas');

/*7. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. */

select * from [dbo].[employee_detail]
where first_name like 'a%';

/*8) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.*/
select * from [dbo].[employee_detail]
where first_name like 'a%';

/*9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'*/

select * from [dbo].[employee_detail]
where first_name like '%h';

/*10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' */

select * from [dbo].[employee_detail]
where first_name like '[a-p]%'

/*11. Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p' */

select * from [dbo].[employee_detail]
where first_name not like '[a-p]%';

/*12.  Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters.
The Underscore(_) Wildcard Character represents any single character */

select * from [dbo].[employee_detail]
where gender like '__le';

/* 13.Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters */
select * from [dbo].[employee_detail]
where first_name like 'a____';

/*14.  Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as". */
SELECT * FROM [dbo].[employee_detail]
WHERE [First_Name] LIKE '%[%]%';

/*15. Get all unique "Department" from EmployeeDetail table */

SELECT DISTINCT([department]) FROM [dbo].[employee_detail]

/*16. Get the highest "Salary" from EmployeeDetail table.*/

SELECT MAX([salary]) FROM [dbo].[employee_detail]

/*17. Get the lowest "Salary" from EmployeeDetail table.*/

SELECT MIN ([salary]) FROM [dbo].[employee_detail]

/*18.  Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013 */

SELECT * FROM [dbo].[employee_detail]

select convert(varchar, [joining_date],106) as date_of_joining
from [dbo].[employee_detail];

/*19. Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15" */

select convert(varchar,[joining_date],111) as formatted_date
from [dbo].[employee_detail];

/*20. Show only time part of the "JoiningDate"*/

select convert(varchar,joining_date,114) as only_time
from [dbo].[employee_detail]

/*21. Get only Year part of "JoiningDate" */

select year(joining_date) as year_joining_date
from [dbo].[employee_detail];

/*22. Get only Month part of "JoiningDate” */

select month(joining_date) as only_month 
from [dbo].[employee_detail];

select datename(month, joining_date) as month_name 
from [dbo].[employee_detail]

/*23. Get system date */
select convert(date,getdate(),106) as currentdate;

/*24. Get UTC date.*/

select convert(date,getutcdate(),106) as currentutcdate;

/*25.Get the first name, current date, joiningdate and diff between current date and joining date in days.*/

select * from [dbo].[employee_detail]

select first_name, convert(date,getdate(),106) as currentdate , convert(date,joining_date,106) as joiningdate ,DATEDIFF(day,joining_date,getdate()) as days_diff
from [dbo].[employee_detail];

/*26. Get all employee details from EmployeeDetail table whose joining year is 2013 */

 select * from [dbo].[employee_detail]
 where year(joining_date)=2013;

/*27 Get all employee details from EmployeeDetail table whose joining month is Jan */

select * from [dbo].[employee_detail]
where datename(month,joining_date) = 'January';
 /*OR*/
 select * from [dbo].[employee_detail]
where month(joining_date) = 1;

/*28. Get all employee details from EmployeeDetail table whose joining month is Feb*/
select * from [dbo].[employee_detail]
where datename(month,joining_date) = 'February';
/*or*/
select * from [dbo].[employee_detail]
where month(joining_date) = 2;

/*29. Get how many employee exist in "EmployeeDetail" table */

select count(employee_id) from [dbo].[employee_detail];  /*5*/

/*31. Select only one/top 1 record from "EmployeeDetail" table*/

select top 1 *  from [dbo].[employee_detail];

/*32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".*/

select * from [dbo].[employee_detail]
where first_name in ('Vikas','Ashish','Nikhil');

/*33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil" */

select * from [dbo].[employee_detail]
where first_name not in ('Vikas','Ashish','Nikhil');

/*34. Select first name from "EmployeeDetail" table after removing white spaces from right side */

select RTRIM([first_name]) as first_name_wo_whitespace 
from [dbo].[employee_detail];

/*35. Select first name from "EmployeeDetail" table after removing white spaces from left side */

select LTRIM([first_name]) as first_name_wo_whitespace
from [dbo].[employee_detail];


/*36. Display first name and Gender as M/F.(if male then M, if Female then F) */

select first_name , 
case 
when Gender='MALE' then 'M'
ELSE'F'
END as gender
from [dbo].[employee_detail]

/*37. Select first name from "EmployeeDetail" table prifixed with "Hello */

select concat('Hello',' ',first_name) as hello_name from [dbo].[employee_detail]

/*38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000*/

select * from [dbo].[employee_detail]
where salary>600000;

/*39.Get employee details from "EmployeeDetail" table whose Salary less than 700000 */

select * from [dbo].[employee_detail]
where salary<700000;

/*40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000 */

select * from [dbo].[employee_detail]
where salary between 500000 and 600000;

/**********Creating ProjectDetail Table*********/

create table projectdetail (projectdetail_id int not null primary key,
employeedetail_id int,
projectname varchar(25));

select * from [dbo].[projectdetail]

insert into projectdetail values 
(1,1,'Task Track'),
(2,1,'CLP'),
(3,1,'Survey Management'),
(4,2,'HR Management'),
(5,3,'Task Track'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR Management'),
(9,6,'GL Management');

/* 41. Give records of ProjectDetail table */

SELECT * FROM [dbo].[projectdetail]

/*42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table. */

SELECT * FROM [dbo].[employee_detail]

SELECT [department], SUM([salary]) as total_salary 
from [dbo].[employee_detail]
group by [department];

/*43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.*/

SELECT [department], SUM([salary]) as total_salary 
from [dbo].[employee_detail]
group by [department]
order by total_salary;

/*44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary */

SELECT [department], SUM([salary]) as total_salary 
from [dbo].[employee_detail]
group by [department]
order by total_salary desc;

/*45. Write the query to get the department, total no. of departments, total(sum) salary 
with respect to department from "EmployeeDetail" table. */

select [department], count([department]) as dept_count,sum([salary]) as tot_salary
from [dbo].[employee_detail]
group by [department];

/*46. Get department wise average salary from "EmployeeDetail" table order by salary ascending */

SELECT [department], avg([salary]) as average_salary 
from [dbo].[employee_detail]
group by [department]
order by average_salary;

/*47. Get department wise maximum salary from "EmployeeDetail" table order by salary ascending*/

SELECT [department], max([salary]) as maximum_salary 
from [dbo].[employee_detail]
group by [department]
order by maximum_salary;

/*48. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending. */

SELECT [department], min([salary]) as maximum_salary 
from [dbo].[employee_detail]
group by [department]
order by maximum_salary;

/*49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending */

SELECT [department], min([salary]) as maximum_salary 
from [dbo].[employee_detail]
group by [department]
order by maximum_salary desc;

/*50.Join both the table that is Employee and ProjectDetail based on some common paramter */

select a.*,b.* from [dbo].[employee_detail] as a
join
[dbo].[projectdetail] as b
on
a.employee_id=b.employeedetail_id;

/*51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for 
those employee which have assigned project already. */

select concat(a.first_name,' ',a.last_name)  as employee_name,b.projectname
from [dbo].[employee_detail] as a
join
[dbo].[projectdetail] as b
on
a.employee_id=b.employeedetail_id
order by a.first_name;

/*52. Get employee name, project name order by firstname from "EmployeeDetail" and 
"ProjectDetail" for all employee even they have not assigned project.*/

select concat(a.first_name,' ',a.last_name)  as employee_name,b.projectname
from [dbo].[employee_detail] as a
left join
[dbo].[projectdetail] as b
on
a.employee_id=b.employeedetail_id
order by a.first_name;

/*53. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee 
if project is not assigned then display "-No Project Assigned" */

select concat(a.[first_name], ' ',a.[last_name]) as employee_name, 
case when
b.projectname IS NULL then 'No Project Assigned'
else b.projectname
end as projectname
from  [dbo].[employee_detail] as a
left join
[dbo].[projectdetail] as b
on a.[employee_id]=b.[employeedetail_id]
order by first_name;

/*54. Get all project name even they have not matching any employeeid, in left table,
order by firstname from "EmployeeDetail" and "ProjectDetail*/

select b.[projectname] from [dbo].[employee_detail] as a
left join
[dbo].[projectdetail] as b
on
a.employee_id=b.employeedetail_id
order by a.first_name;

/*55. Get complete record (employeename, project name) from both tables 
([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL */

select coalesce(concat(a.[first_name], ' ',a.[last_name]),'NULL') as employee_name, 
b.projectname 
from  [dbo].[employee_detail] as a
full outer join
[dbo].[projectdetail] as b
on a.[employee_id]=b.[employeedetail_id]

/*56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]),
if no match found in any table then show NULL */

select coalesce(concat(a.[first_name], ' ',a.[last_name]),'NULL') as employee_name, 
b.projectname 
from  [dbo].[employee_detail] as a
full outer join
[dbo].[projectdetail] as b
on a.[employee_id]=b.[employeedetail_id]

/*57. 57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]),
if no match found in any table then show NULL */

select coalesce(concat(a.[first_name], ' ',a.[last_name]),'NULL') as employee_name, 
b.projectname 
from  [dbo].[employee_detail] as a
full outer join
[dbo].[projectdetail] as b
on a.[employee_id]=b.[employeedetail_id]

/*58. Write down the query to fetch EmployeeName & Project who has assign more than one project */

select concat(a.[first_name], ' ',a.[last_name]) as employee_name, b.[projectname]
from [dbo].[employee_detail] as a
 join 
[dbo].[projectdetail] as b
on a.employee_id=b.employeedetail_id
where b.employeedetail_id in(
select employeedetail_id from projectdetail
group by employeedetail_id
having count(projectdetail_id)>1);

/*59 Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName */  

select concat(a.[first_name], ' ',a.[last_name]) as employee_name, b.[projectname]
from [dbo].[employee_detail] as a
 join 
[dbo].[projectdetail] as b
on a.employee_id=b.employeedetail_id
where b.projectname in ( select projectname from [dbo].[projectdetail]
group by projectname
having count([employeedetail_id])>1)

/*60. Apply Cross Join in Both the tables */

select a.*,b.* from [dbo].[employee_detail] as a
cross join
[dbo].[projectdetail] as b;



























