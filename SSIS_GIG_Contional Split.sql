Create Database SSIS_GIG;

USE SSIS_GIG;




Select top 10 CustomerKey, FirstName,MiddleName,LastName,Gender, EmailAddress, 
EnglishOccupation as Occupation, YearlyIncome into CUSTOMER_DTS from Customer;


Select * from CUSTOMER_DTS;

Alter table CUSTOMER_DTS add ID int identity(1,1);


Select DISTINCT (Occupation) from CUSTOMER_DTS;



--To check Data In table
Select * from CUSTOMER_DTS;
Select * from DIM_CUSTOMER_1;
Select * from DIM_CUSTOMER_2;


--To check Data Male Count in Table
Select COUNT(*) from CUSTOMER_DTS
where Gender = 'M' ;


Select COUNT(*) from DIM_CUSTOMER_1
where Gender = 'M' ;


Select COUNT(*) from DIM_CUSTOMER_2
where Gender = 'M' ;


--To check Data Female Count in Table
Select COUNT(*) from CUSTOMER_DTS
where Gender = 'F' ;


Select COUNT(*) from DIM_CUSTOMER_1
where Gender = 'F' ;


Select COUNT(*) from DIM_CUSTOMER_2
where Gender = 'F' ;







--Truncate Table DIM_CUSTOMER_1;
--Truncate Table DIM_CUSTOMER_2;