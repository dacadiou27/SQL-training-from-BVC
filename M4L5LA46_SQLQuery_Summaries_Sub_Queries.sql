--M4L5 Learning Activity 4.7: Summary and SubQueries
--Use “create_ap.sql” to create database.
Use AP;

--1.Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. Group the result set by VendorID.
SELECT VendorID,SUM(PaymentTotal) AS PaymentSum
FROM  Invoices
GROUP BY VendorID;

--2.Write a SELECT statement that returns two columns: VendorName and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. Group the result set by VendorName. Return only 10 rows, corresponding to the 10 vendors who’ve been paid the most.
--Hint: Use the TOP clause and join Vendors to Invoices.
SELECT TOP 10 V.VendorName,SUM(I.PaymentTotal) AS PaymentSum
FROM  Invoices I JOIN Vendors V
ON I.VendorID = V.VendorID
GROUP BY VendorName
ORDER BY PaymentSum DESC;

--3.Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. Group the result set by vendor. Sort the result set so that the vendor with the highest number of invoices appears first.
SELECT V.VendorName, SUM(I.InvoiceTotal) AS InvoiceSum,COUNT(I.InvoiceNumber) AS InvoiceCount
FROM  Invoices I JOIN Vendors V
ON I.VendorID = V.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC;

--4.Write a SELECT statement that answers this question: Which vendors are being paid from more than one account?
--Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices.
--Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo
SELECT V.VendorName, COUNT( DISTINCT I.AccountNo) AS AccountCount
FROM  InvoiceLineItems I JOIN Vendors V
ON I.AccountNo = V.DefaultAccountNo
GROUP BY VendorName
ORDER BY AccountCount DESC;
-- all using an account

--5.Write a SELECT statement that returns six columns:
--VendorID
--From the Invoices table
--InvoiceDate
--From the Invoices table
--InvoiceTotal
--From the Invoices table
--VendorTotal
--The sum of the invoice totals for each vendor
--VendorCount
--The count of invoices for each vendor
--VendorAvg
--The average of the invoice totals for each vendor
--The result set should include the individual invoices for each
SELECT V.VendorID,  SUM(I.InvoiceTotal) AS VendorTotal, AVG(I.InvoiceTotal) AS VendorAvg,MIN (I.InvoiceDate) AS 'Oldest invoice date' ,MAX( I.InvoiceTotal) AS 'Maximun Invoice'
FROM  Invoices I JOIN Vendors V
ON I.VendorID = V.VendorID
GROUP BY V.VendorID
ORDER BY VendorID DESC;


--6.Write a SELECT statement that answers this question: Which invoices have a PaymentTotal that’s greater than the average PaymentTotal for all paid invoices?
--Return the InvoiceNumber and InvoiceTotal for each invoice.
--sub query--
SELECT  (I.PaymentTotal)
FROM Invoices I
--return 1566.4398

--Combined--
SELECT I.InvoiceNumber,I.PaymentTotal
FROM Invoices I
WHERE PaymentTotal > 
	(
	SELECT AVG(I.PaymentTotal)
	FROM Invoices I
	)
ORDER BY I.InvoiceNumber
