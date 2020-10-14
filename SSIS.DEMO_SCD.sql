 Create Database SSIS_DEMO;

 USE SSIS_DEMO;



CREATE TABLE Employee_Src

(EmpID int Primary key,
FirstName varchar(50),
LastName varchar(50),
Designation varchar(50));

SELECT * FROM Employee_Src;




INSERT [dbo].[Employee_Src] ([EmpID], [FirstName], [LastName], [Designation])
VALUES (101, N'Michael', N'Smith', N'Software Test Engineer');

INSERT [dbo].[Employee_Src] ([EmpID], [FirstName], [LastName], [Designation])
VALUES (102, N'Sarah', N'Roberts', N'Sr.Software Test Engineer');

INSERT [dbo].[Employee_Src] ([EmpID], [FirstName], [LastName], [Designation])
VALUES (103, N'Rick', N'Tulman', N'Project Manager');

INSERT [dbo].[Employee_Src] ([EmpID], [FirstName], [LastName], [Designation])
VALUES (104, N'Robert', N'Tyler', N'Trainee Engineer');

INSERT [dbo].[Employee_Src] ([EmpID], [FirstName], [LastName], [Designation])
VALUES (105, N'Samantha', N'Jameson', N'Sr. Project Manager');



CREATE TABLE DimEmployee

(
EmpID int,
FirstName varchar(50),
LastName varchar(50),
Designation varchar(50),
Start_Date datetime,
End_Date datetime);


--Truncate table DimEmployee;
--Truncate table Employee_Src;


DROP TABLE DimEmployee;

Select * from Employee_SRC;

Select * from DimEmployee;


Delete from Employee_SRC;



----SCD Testing

--1st Run
Update Employee_Src set FirstName  = ('Mike')
where EmpId = 101 ;

Update Employee_Src set LastName = ('Parker')
where EmpId = 102 ;

Update Employee_Src set Designation = ('Sr.Project Manager')
where EmpId = 103;



--2nd run
Update Employee_Src set FirstName = ('xyz')
where EmpId = 101 ;

Update Employee_Src set LastName = ('Jackson')
where EmpId = 102 ;

Update Employee_Src set Designation = ('DM')
where EmpId = 103;



Select * from Employee_SRC;

Select * from DimEmployee;


--Alter table DimEmployee drop id;
--Alter table DimEmployee ALTER COLUMN id INT;



Alter table DimEmployee ADD Empkey INT IDENTITY (1,1) primary key;



ALTER TABLE DimEmployee DROP  Empkey;



Select EmpID,FirstName,LastName,Designation	 FROM DimEmployee 
WHERE Empkey In (SELECT MAX(Empkey) 
                 FROM DimEmployee 
     GROUP BY EmpID)

Except

Select EmpID,FirstName,LastName,Designation	
 from Employee_SRC;

 Select EmpID,FirstName,LastName,Designation	 FROM DimEmployee 
WHERE Empkey In (SELECT MAX(Empkey) 
                 FROM DimEmployee 
     GROUP BY EmpID)


Select EmpID,FirstName,LastName,Designation	
 from Employee_SRC

 Except
 
 Select   EmpID,FirstName,LastName,Designation	 FROM DimEmployee 
WHERE Empkey In (SELECT MAX(Empkey) 
                 FROM DimEmployee 
     GROUP BY EmpID)


	 date<= to_char (01-02-2019) and date >= 28-02-2019




Alter TABLE DimEmployee add EMPKEY int identity(1,1) primary key ;