---SSIS Drived COlumn



Select top 10 * Into CUSTOMER_DerivedColumn from CUSTOMER_DTS ; 

Drop Table CUSTOMER_DerivedColumn;


Select *  from CUSTOMER_DerivedColumn;

Select *  from [SSIS_GIG].dbo.[DimCustomer] ;



Select  top 10 CustomerKey,(LASTNAME + '-' + FIRSTNAME + '-' + MIDDLENAME) AS CustomerName, Gender, Occupation, YearlyIncome 
INto DimCustomer  from CUSTOMER_DTS ; 

Truncate Table DimCustomer;


--ssis Expersion

(ISNULL(CustomerKey) ? "" : CustomerKey) + " " + (ISNULL(LastName) ? "" : LastName)