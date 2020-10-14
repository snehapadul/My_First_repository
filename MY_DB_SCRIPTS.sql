USE MY_DB

select * from EMP_DTS_SRC1;

select * from EMP_DTS_SRC2;

select * from EMP_DTS_SRC3;

select * from EMP_DTS_TRG;



TRUNCATE TABLE EMP_DTS_SRC1;

TRUNCATE TABLE EMP_DTS_SRC2;

TRUNCATE TABLE EMP_DTS_SRC3;





Select 
	Count(*)
From 
	EMP_DTS_TRG;


TRUNCATE TABLE EMP_DTS_TRG;

   
   
INSERT INTO EMP_DTS_SRC1 VALUES ('1','SMITH','JOHN','A',2000,'1991-11-01','male','2017-04-09');
INSERT INTO EMP_DTS_SRC1 VALUES ('2','HERB','PETER','S',5000,'1996-11-22','Female','2013-04-09');
INSERT INTO EMP_DTS_SRC1 VALUES ('3','WATSON','TOM','D',600,'1993-12-02','MALE','2010-04-09');
INSERT INTO EMP_DTS_SRC1 VALUES ('4','McCULLUM','BILL','U',8000,'1990-12-02','female','2015-04-09');
INSERT INTO EMP_DTS_SRC1 VALUES ('5','CARTER','JIM','N',9000,'1993-12-02','F','2018-04-09');


INSERT INTO EMP_DTS_SRC2 VALUES ('6','BRYYANT','WILL','Z',900,'1993-12-02','F','2018-04-09');
INSERT INTO EMP_DTS_SRC2 VALUES ('7','CURRAN','KATE','B',5000,'1978-12-02','f','2001-04-09');
INSERT INTO EMP_DTS_SRC2 VALUES ('8','ROSS','EMMA','H',8000,'1993-12-02','M','2018-04-09');
    
INSERT INTO EMP_DTS_SRC3 VALUES ('9','ROSS','ALEX','F',700,'1978-12-02','1','1999-04-09');    
INSERT INTO EMP_DTS_SRC3 VALUES ('10','ROSS','ALEX','F',7000,'1978-12-02','1','1999-04-09');
INSERT INTO EMP_DTS_SRC3 VALUES ('11','TAYLOR','JIMMY','P',4000,'1989-12-02','2','2011-04-09');
INSERT INTO EMP_DTS_SRC3 VALUES ('12','LISTER','BEN','O',4000,'1993-12-02','1','2018-04-09');
INSERT INTO EMP_DTS_SRC3 VALUES ('13','X','Y','Z',9000,'1993-12-02','1','2018-04-09');


INSERT INTO [MYDB].[dbo].[EMP_DTS_SRC1]
           ([EMP_ID]
           ,[LAST_NAME]
           ,[FIRST_NAME]
          --,[MIDDLE_NAME]
           ,[EMP_SALARY]
           ,[EMP_DOB]
           ,[EMP_GENDER]
           ,[HIRE_DATE])
     VALUES
           (18
           ,'Raut '
           ,'Kshitij '
           --,'A'
           ,'5000'
           ,'1994-04-09'
           ,'A'
           ,'2018-04-09')
GO

Select* From EMP_DTS_t
Where EMP_ID = 18



select * from EMP_DTS_TRG;


--Check Auto-genearted field

select max(ID) from EMP_DTS_TRG
--except
select COUNT(ID) from EMP_DTS_TRG;
--where EMP_ID is null or EMP_NAME is null or EMP_DOB is null and EMP_GENDER is null and  is null and   ;



--Check COUNT EMP_DTS_SRC1

Select count(*)as COUNT_OF_EMP_DTS_SRC1 from EMP_DTS_SRC1
where EMP_SALARY >= '1000';

Select count(*)as COUNT_OF_EMP_DTS_TRG from EMP_DTS_TRG
where audit_action ='Inserted Record EMP_DTS_SRC1' ;

--Check COUNT EMP_DTS_SRC2 

Select count(*)as COUNT_OF_EMP_DTS_SRC2 from EMP_DTS_SRC2
where EMP_SALARY >= '1000';

Select count(*)as COUNT_OF_EMP_DTS_TRG from EMP_DTS_TRG
where audit_action ='Inserted Record EMP_DTS_SRC2' ;

--Check COUNT EMP_DTS_SRC3 

Select count(*)as COUNT_OF_EMP_DTS_SRC3 from EMP_DTS_SRC3
where EMP_SALARY >= '1000';

Select count(*)as COUNT_OF_EMP_DTS_TRG from EMP_DTS_TRG
where audit_action ='Inserted Record EMP_DTS_SRC3' ;

--COUNT OF ALL TABLES
 select sum(ct) from 
 (select COUNT(*) as ct from EMP_DTS_SRC1
 where EMP_SALARY >= '1000'
 Union all
 select COUNT(*) as ct from EMP_DTS_SRC2
 where EMP_SALARY >= '1000'
 Union all
 select COUNT(*) as ct from EMP_DTS_SRC3
 where EMP_SALARY >= '1000') as result;


 Except

 Select COUNT(*) from EMP_DTS_TRG;



--Check NULL COUNT 
select COUNT(ID) AS ID from EMP_DTS_TRG;
--Check data in EMP_DTS_TRG
select COUNT(*)-COUNT(ID) AS ID, COUNT(*)-COUNT(EMP_ID) EMP_ID,COUNT(*)-COUNT(EMP_GENDER) EMP_GENDER
,COUNT(*)-COUNT(EMP_NAME) EMP_NAME ,COUNT(*)-COUNT(HIRE_DATE) HIRE_DATE,
COUNT(*)-COUNT(Audit_Action) Audit_Action
 from EMP_DTS_TRG;

--Check data in EMP_DTS_SRC1
 select COUNT(*)-COUNT(EMP_ID) EMP_ID,COUNT(*)-COUNT(EMP_GENDER) EMP_GENDER
,COUNT(*)-COUNT(LAST_NAME) LAST_NAME ,
COUNT(*)-COUNT(FIRST_NAME) FIRST_NAME ,
COUNT(*)-COUNT(MIDDLE_NAME) MIDDLE_NAME ,COUNT(*)-COUNT(HIRE_DATE) HIRE_DATE
 from EMP_DTS_SRC1;

--Check data in EMP_DTS_SRC2
 select COUNT(*)-COUNT(EMP_ID) EMP_ID,COUNT(*)-COUNT(EMP_GENDER) EMP_GENDER
,COUNT(*)-COUNT(LAST_NAME) LAST_NAME ,
COUNT(*)-COUNT(FIRST_NAME) FIRST_NAME ,
COUNT(*)-COUNT(MIDDLE_NAME) MIDDLE_NAME ,COUNT(*)-COUNT(HIRE_DATE) HIRE_DATE
 from EMP_DTS_SRC2;

 --Check data in EMP_DTS_SRC3
 select COUNT(*)-COUNT(EMP_ID) EMP_ID,COUNT(*)-COUNT(EMP_GENDER) EMP_GENDER
,COUNT(*)-COUNT(LAST_NAME) LAST_NAME ,
COUNT(*)-COUNT(FIRST_NAME) FIRST_NAME ,
COUNT(*)-COUNT(MIDDLE_NAME) MIDDLE_NAME ,COUNT(*)-COUNT(HIRE_DATE) HIRE_DATE
 from EMP_DTS_SRC3;

 
--Check duplicate data

SELECT 
	EMP_ID, COUNT(*) AS DuplicatesCount
FROM 
	EMP_DTS_TRG
GROUP BY
	EMP_ID
having count(*)>1;



DELETE FROM EMP_DTS_TRG 
WHERE ID NOT IN (SELECT MAX(ID) 
                 FROM EMP_DTS_TRG 
     GROUP BY EMP_ID);






--Rejected Records
Select * from EMP_DTS_TRG
where EMP_SALARY<'1000';




--EMP_NAME TRANSFORMATION EMP_DTS_SRC1

Select EMP_ID,LAST_NAME,FIRST_NAME,MIDDLE_NAME from EMP_DTS_SRC1;


Select EMP_ID, (LAST_NAME +'-' + FIRST_NAME + '-' +MIDDLE_NAME) as Emp_Namefrom EMP_DTS_SRC1
where EMP_SALARY >= '1000'



except

Select EMP_ID, EMP_Name from EMP_DTS_TRG
where Audit_action = 'Inserted Record EMP_DTS_SRC1 ';



--EMP_NAME TRANSFORMATION EMP_DTS_SRC2

select EMP_ID, EMP_Name from EMP_DTS_TRG
where Audit_action = 'Inserted Record EMP_DTS_SRC2 '

except 

select EMP_ID,(LAST_NAME + '-' + FIRST_NAME + '-' +MIDDLE_NAME) from EMP_DTS_SRC2

Where EMP_SALARY >= '1000';


--EMP_NAME TRANSFORMATION EMP_DTS_SRC3

Select EMP_ID, EMP_Name from EMP_DTS_TRG
where Audit_action = 'Inserted Record EMP_DTS_SRC3 '
except
Select EMP_ID,(LAST_NAME + '-' + FIRST_NAME + '-' +MIDDLE_NAME) from EMP_DTS_SRC3

Where EMP_SALARY >= '1000';




-- Hiredate TRANSFORMATION


SELECT EMP_ID,HIRE_DATE, TOTAL_EXP FROM EMP_DTS_TRG 
where Audit_action = 'Inserted Record EMP_DTS_SRC1 ' 

EXCEPT

SELECT EMP_ID,HIRE_DATE, DATEDIFF (YYYY,HIRE_DATE,GETDATE()) AS TOTAL_EXP FROM EMP_DTS_SRC1;





Select Hire_date,
convert(char(10),Hire_date,105) AS DATE,
DATENAME (DW,Hire_date)+ ' ' +
DATENAME (DD,Hire_date)+ ' ' +
DATENAME (MM,Hire_date)+ ' ' +
DATENAME (YY,Hire_date)as DAY_IN_WEEK 	
from EMP_DTS_TRG;


--SQL Server
SELECT convert (varchar(100),GETDATE(),100-110);

--Oracle
SELECT TO_CHAR (CURRENT_DATE, 'MM-DD-YYYY HH:MI:SS') FROM dual;


-- EMP GENDER
--Solution1
Select EMP_ID,
 EMP_GENDER = CASE WHEN EMP_GENDER='1' OR (EMP_GENDER)='male' 
	OR (EMP_GENDER)='M' THEN 'M' 
	WHEN EMP_GENDER='2' 
	OR (EMP_GENDER)='female' 
	OR (EMP_GENDER)='F'
	 THEN 'F' END  from EMP_DTS_SRC3
Where EMP_SALARY >= '1000'

Except

Select EMP_ID, EMP_GENDER from EMP_DTS_TRG
where Audit_action = 'Inserted Record EMP_DTS_SRC3';


--Solution2
Select EMP_ID, EMP_GENDER, Audit_Action from EMP_DTS_TRG
where EMP_ID NOT IN (SELECT EMP_ID FROM EMP_DTS_TRG WHERE EMP_GENDER in ('M','F'));

Select * from EMP_DTS_SRC1 WHere EMP_ID = 5 
Select * from EMP_DTS_SRC2 Where EMP_ID = 7


--EMP SALARY

	select * FROM EMP_DTS_SRC3
	where EMP_SALARY < '1000';

select * from EMP_DTS_TRG
Where EMP_ID in ( 9 )

---
select EMP_ID, from EMP_DTS_TRG
except
select * from EMP_DTS_SRC1
where Audit_action = 'Inserted Record EMP_DTS_SRC1 ';

Select EMP_ID, EMP_DOB, HIRE_DATE from EMP_DTS_SRC3 
WHere EMP_SALARY >= '1000'
--Except
Select EMP_ID, EMP_DOB, HIRE_DATE from EMP_DTS_TRG 
where Audit_action = 'Inserted Record EMP_DTS_SRC3 ';
