
CREATE DATABASE TEST_DB
USE TEST_DB

CREATE TABLE [dbo].[Orders](
	[order_id] [int] NULL,
	[order_num] [varchar](50) NULL,
	[customer_id] [int] NULL
) 

CREATE TABLE [dbo].[Orders_Lines](
	[line_id] [int] NULL,
	[order_id] [varchar](50) NULL,
	[product_id] [int] NULL,
	[amount] [decimal](10, 2) NULL
) 
GO
INSERT [dbo].[Orders] ([order_id], [order_num], [customer_id]) VALUES (1, N'A1', 1)
INSERT [dbo].[Orders] ([order_id], [order_num], [customer_id]) VALUES (2, N'A2', 2)
INSERT [dbo].[Orders] ([order_id], [order_num], [customer_id]) VALUES (3, N'A3', 3)
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (1, N'1', 1, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (2, N'1', 2, CAST(13.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (3, N'1', 3, CAST(2.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (4, N'1', 4, CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (5, N'2', 1, CAST(88.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (6, N'2', 2, CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (7, N'2', 3, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (8, N'3', 1, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (9, N'3', 2, CAST(27.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (10, N'3', 3, CAST(29.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (11, N'3', 4, CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders_Lines] ([line_id], [order_id], [product_id], [amount]) VALUES (12, N'3', 5, CAST(50.00 AS Decimal(10, 2)))


SELECT  * FROM Orders
JOIN Orders_Lines ON Orders.order_id = Orders_Lines.order_id 



Select distinct(o.customer_id) 
from Orders o ,Orders_Lines ol
where o.order_id = ol.order_id
group by o.customer_id
having count (distinct ol.product_id) > 3 and sum (ol.amount)> 100 ;


























1	A1	1		1	1	1	12
2	A2	2		2	1	2	13
3	A3	3		3	1	3	2
				4	1	4	5
				5	2	1	88
				6	2	2	80
				7	2	3	1
				8	3	1	25
				9	3	2	27
				10	3	3	29
				11	3	4	40
				12	3	5	50
