--M4 LA43 Data Retrieval from Multiple Tables
use AP;
--1.Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table.
SELECT *
	FROM vendors INNER JOIN invoices
	ON vendors.VendorID = invoices.VendorID;

--2.Write a SELECT statement that returns four columns:
--VendorName
--From the Vendors table
--InvoiceNumber
--From the Invoices table
--InvoiceDate
--From the Invoices table
--Balance
--InvoiceTotal minus the sum of PaymentTotal and CreditTotal
--The result set should have one row for each invoice with a non-zero balance. Sort the result set by VendorName in ascending order.
SELECT VendorName,InvoiceNumber,InvoiceDate,Balance = InvoiceTotal - PaymentTotal - CreditTotal
	FROM Vendors V	INNER JOIN Invoices I
	ON V.VendorID = I.VendorID
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal)>0
	ORDER BY VendorName ASC;
	

--3.Write a SELECT statement that returns three columns:
--VendorName
--From the Vendors table
--DefaultAccountNo
--From the Vendors table
--AccountDescription
--From the GLAccounts table
--The result set should have one row for each vendor, with the account number and account description for that vendor’s default account number. Sort the result set by AccountDescription, then by VendorName.
SELECT VendorName,DefaultAccountNo,AccountDescription
	FROM Vendors V	INNER JOIN GLAccounts G
	ON V.DefaultAccountNo = G.AccountNo
	ORDER BY AccountDescription,VendorName ASC;

--4.Write a SELECT statement that returns five columns from three tables, all using column aliases:
--Vendor
--VendorName column
--Date
--InvoiceDate column
--Number
--InvoiceNumber column
--#
--InvoiceSequence column
--LineItem
--InvoiceLineItemAmount column
--Assign the following correlation names to the tables:

--‘V’ for Vendors table
--‘I’ for Invoices table
--‘LI’ for InvoiceLineItems table
--Sort the final result set by Vendor, Date, Number, and #.

SELECT I.InvoiceDate,I.InvoiceNumber,V.VendorName,LI.InvoiceSequence
	FROM Invoices AS I
	INNER JOIN Vendors V ON V.VendorID = I.VendorID
	INNER JOIN InvoiceLineItems LI ON LI.InvoiceID = I.InvoiceID
	ORDER BY VendorName,InvoiceDate, InvoiceNumber ASC;

--5. Use the UNION operator to generate a result set consisting of two columns from the Vendors table: VendorName and VendorState. 
--If the vendor is in California, the VendorState value should be “CA”; otherwise, the VendorState value should be “Outside CA.” 
--Sort the final result set by VendorName.
	SELECT VendorName, 'CA' AS StateLocation
	FROM Vendors
	WHERE VendorState='CA'
UNION 
	SELECT VendorName,'outside CA' AS StateLocation
	FROM Vendors
	WHERE  VendorState <> 'CA'
ORDER BY VendorName;