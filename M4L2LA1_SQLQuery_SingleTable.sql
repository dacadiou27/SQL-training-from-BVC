--M4 LA 1 --Learning Activity 4.1:Data Retrieval from single Table
use AP;
--1.Select all column from vendor
SELECT *
FROM VENDORS;

--2.Select id and name from vendor
SELECT VendorID,VendorName
FROM VENDORS;

--3.Return the vendor ID, date, and invoice total of all invoices
SELECT VendorID,InvoiceDate,InvoiceTotal
FROM Invoices;

--4.Return the invoice number as “Number” and the invoice date as “Date” from Invoices.
SELECT InvoiceNumber AS Number,
	InvoiceDate AS Date
FROM Invoices;

--5.Return all vendor names and IDs, with a single column for both lines of mailing address called “Mailing Address”
SELECT VendorID, VendorName,VendorAddress1,VendorAddress2,
VendorAddress1 + VendorAddress2 AS 'Mailing Address', --issues when one of the 2 is NULL
VendorAddress1+ ' '+ COALESCE(VendorAddress2, '') AS 'Mailing Address 2'
FROM VENDORS;

--6.Return all vendor names and a single column for city and state called “Region.”
SELECT VendorName,
VendorCity + ' ' + VendorState AS Region
FROM VENDORS;

--7.Return all distinct invoice dates from invoices
SELECT DISTINCT InvoiceDate
FROM Invoices;

--8.Return all distinct city, state combinations from Vendors
SELECT DISTINCT VendorCity,VendorState
FROM Vendors;

--9.Return all distinct zip codes from Vendors.
SELECT DISTINCT VendorZipCode
FROM Vendors;

--10.Return all vendors ordered by last name, then first name.
SELECT VendorName
FROM Vendors
ORDER BY VendorContactLName,VendorContactFName;

--11.Return the top five most recent invoices.
SELECT TOP 5 *
FROM Invoices
ORDER BY InvoiceDate DESC;

--12.Return the top 10 percent oldest invoices
SELECT TOP 10 PERCENT *
FROM Invoices
ORDER BY InvoiceDate ASC;

--13.Select the bottom ten percent of invoice line items by amount.
SELECT TOP 10 PERCENT *
FROM Invoices
ORDER BY InvoiceTotal ASC;

--14.Select the top ten percent of invoices ordered by invoicetotal. 
SELECT TOP 10 PERCENT *
FROM Invoices
ORDER BY InvoiceTotal DESC;

--15.Return the vendorID column, invoice total, and amount owed. Amount owed is equal to credit + payment -total. 
SELECT VendorID,CreditTotal,PaymentTotal,InvoiceTotal,
	InvoiceTotal - CreditTotal - PaymentTotal AS "Amount owed"
FROM Invoices;

--16.Select all invoices with a payment less than the invoice total.
SELECT *
FROM Invoices
WHERE PaymentTotal<InvoiceTotal;

--17.Return all vendors who are located in a state other than CA
SELECT *
FROM Vendors
WHERE VendorState NOT IN ('CA');

--18.Select all line items with an invoice ID greater than 50 and an amount less than 1000.
SELECT *
FROM Invoices
WHERE InvoiceID>50 AND InvoiceTotal<1000;

--19.Find all invoices with a total amount greater than or equal to 500 and a date less than January 15, 2016.
SELECT *
FROM Invoices
WHERE InvoiceDate < '2016-01-15' AND InvoiceTotal>=500;

--20.Return all invoices with a payment total between 0 and 500.
SELECT *
FROM Invoices
WHERE   InvoiceTotal>0 AND InvoiceTotal<500;

--21.Return all vendors located in one of the following states: AL,AB,FL,MS
SELECT *
FROM Vendors
WHERE VendorState IN ('AL', 'AB','FL','MS');

-- Return all the vendors with 'Main' in their address
SELECT *
FROM Vendors
--WHERE VendorAddress1 LIKE '%Main%' OR VendorAddress2 LIKE '%Main%' ; --NO OUTPUT
WHERE VendorAddress1 LIKE '%Box%' OR VendorAddress2 LIKE '%Box%' ;