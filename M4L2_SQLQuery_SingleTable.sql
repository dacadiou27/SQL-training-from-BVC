--SELECT all columns in a table
SELECT * FROM Invoices;

--SELECT column name in a table
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal;

--SELECT & Arithmetic expression
SELECT InvoiceID, InvoiceTotal,
CreditTotal + PaymentTotal AS TotalCredits
--OR
--TotalCredits = CreditTotal + PaymentTotal
FROM Invoices
WHERE InvoiceID = 17;

	--An arithmetic expression is used to calculate BalanceDue
SELECT InvoiceNumber, InvoiceTotal -PaymentTotal - CreditTotal
AS BalanceDue
FROM Invoices;
	--A string expression is used to calculate FullName
SELECT VendorContactFName + ' ' + VendorContactLName 
AS FullName 
FROM Vendors;

SELECT VendorName + '''s Address: ',
 VendorCity +', '+ VendorState +' '+ VendorZipCode
AS VendorAdress
FROM Vendors
	--A function is used to calculate CurrentDate
SELECT InvoiceNumber, InvoiceDate,
GETDATE() AS CurrentDate
FROM Invoices;

SELECT VendorContactFName, VendorContactLName,
LEFT(VendorContactFName,1)+
LEFT(VendorContactLName,1) 
AS Initials
FROM Vendors;

SELECT 'Invoice: #' + InvoiceNumber 
+ ', date ' + CONVERT(char(8),PaymentDate,1) 
+ ' for $' + CONVERT(varchar(9),PaymentTotal,1)
FROM Invoices;

-- ORDER BY
SELECT VendorCity,VendorState 
FROM Vendors
--ORDER BY VendorCity ASC;--ascending order
ORDER BY VendorCity DESC;--descending order

SELECT VendorName,
VendorCity + ', ' + VendorState + ' ' + VendorZipCode
AS Address
FROM Vendors
ORDER BY VendorContactLName + VendorContactLName;
-- ORDER BY 2,1;


--DISTINCT --eliminate duplicate rows & order by ascending order
SELECT DISTINCT VendorCity,VendorState
FROM Vendors;

--TOP clause -- limit the number of rows in the result set
SELECT TOP 5 VendorID, InvoiceTotal
FROM Invoices
ORDER by InvoiceTotal DESC;
--TOP clause and PERCENT
SELECT TOP 10 PERCENT VendorID, InvoiceTotal
FROM Invoices
ORDER by InvoiceTotal DESC;
--TOP clause and  WITH TIES
SELECT TOP 5  WITH TIES VendorID, InvoiceDate
FROM Invoices
ORDER By InvoiceDate ASC;

SELECT TOP 10 PERCENT WITH TIES VendorID, InvoiceDate
FROM Invoices
ORDER By InvoiceDate ASC;

--WHERE clause (Filtering)
--	=	>	<	<=	 >=		<> (not equal to)
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal 
FROM Invoices
WHERE InvoiceTotal > 5000;
--Vendors located in Iowa
--WHERE VendorState = 'IA'
--Invoices with a balance due (two variations)
--WHERE InvoiceTotal –PaymentTotal –CreditTotal > 0
--WHERE InvoiceTotal > PaymentTotal + CreditTotal
--Vendors with names from A to L
--WHERE VendorName < 'M'
--Invoices on or before a specified date
--WHERE InvoiceDate <= '2016-05-31'
--Invoices on or after a specified date
--WHERE InvoiceDate >= '5/1/16'
--Invoices with credits that don’t equal zero
--WHERE CreditTotal <> 0

--Logical operator AND OR NOT
--WHERE VendorState = 'NJ' AND YTDPurchases> 200The OR operator
--WHERE VendorState = 'NJ' OR YTDPurchases> 200
--WHERE NOT (InvoiceTotal >= 5000 OR NOT InvoiceDate <= '2016-07-01')
--WHERE InvoiceTotal < 5000 AND InvoiceDate <= '2016-07-01'

--IN and NOT IN keyword
--WHERE TermsID IN (1, 3, 4)
--WHERE VendorState NOT IN ('CA', 'NV', 'OR')
--WHERE VendorID IN
--	(SELECT VendorID
--	FROM Invoices
--	WHERE InvoiceDate = '2016-05-01')

--BETWEEN operator
--WHERE InvoiceDate BETWEEN '2016-05-01' AND '2016-05-31'
--WHERE VendorZipCode NOT BETWEEN 93600 AND 93799A BETWEEN 
--WHERE InvoiceTotal –PaymentTotal –CreditTotal BETWEEN 200 AND 500
--WHERE InvoiceDueDate BETWEEN GetDate() AND GetDate() + 30

--LIKE operator
--WHERE VendorCity LIKE 'SAN%' --retrieved “San Diego” and “Santa Ana”
--WHERE VendorName LIKE 'COMPU_ER%' -- retrieved "Compuserve” and “Computerworld”
--WHERE VendorContactLName LIKE 'DAMI[EO]N' --retrieved “Damien” and “Damion”
--WHERE VendorState LIKE 'N[A-J]' --retrieved  "NC” and “NJ” but not “NV” or “NY”
--WHERE VendorState LIKE 'N[^K-Y]' --retrieved “NC” and “NJ” but not “NV” or “NY”
--WHERE VendorZipCode NOT LIKE '[1-9]%' --retrieved “02107” and “08816"

--IS NULL Clause
--WHERE expression IS [NOT] NULL

--CASE Keyword
--SELECT   ProductNumber, Name, "Price Range" = 
--	CASE 
--		WHEN ListPrice =  0 THEN 'Mfg item -not for resale'
--		WHEN ListPrice < 50 THEN 'Under $50'
--		WHEN ListPrice >= 50 and ListPrice < 250 THEN 'Under $250'
--		WHEN ListPrice >= 250 and ListPrice < 1000 THEN 'Under $1000'
--		ELSE 'Over $1000'END
--	FROM Production.Product
--	ORDER BY ProductNumber ;