use AP;
--SQL JOINS (Combine data into new Columns)
-- (INNER) JOIN
	--SELECT columns
	--	FROM table1 
	--  INNER JOIN table2
	--	ON table1.column = table2.column;

	--SELECT suppliers.supplier_id, suppliers.supplier_name, orders.order_date
	--	FROM suppliers -- OR --	FROM suppliers s
	--  INNER JOIN orders -- OR --INNER JOIN orders o
	--	ON suppliers.supplier_id = orders.supplier_id; --OR --	ON s.supplier_id = o.supplier_id; 
	-- return all rows  from supliers and orders tables where there is a matching supplier_id
	
	SELECT InvoiceNumber,InvoiceDate,InvoiceTotal,InvoiceLineItemAmount
	FROM Invoices	JOIN InvoiceLineItems AS LineItems
	ON (Invoices.InvoiceID = LineItems.InvoiceID) 
		AND (Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount)
	ORDER BY InvoiceNumber;

-- LEFT(OUTER)JOIN
	--SELECT columns
	--	FROM table1  
	--  LEFT [OUTER] JOIN table2
	--	ON table1.column = table2.column;

	--SELECT suppliers.supplier_id, suppliers.supplier_name, orders.order_date
	--	FROM suppliers 
	--	LEFT OUTER JOIN orders
	--	ON suppliers.supplier_id = orders.supplier_id

-- RIGHT(OUTER)JOIN
	--SELECT columns
	--	FROM table1 
	--	RIGHT [OUTER] JOIN table2
	--	ON table1.column = table2.column;

	--SELECT orders.order_id, orders.order_date, suppliers.supplier_name
	--	FROM suppliers 
	--	RIGHT OUTER JOIN orders
	--	ON suppliers.supplier_id = orders.supplier_id;

-- FULL(OUTER)JOIN
	--SELECT columns
	--	FROM table1 
	--	FULL [OUTER] JOIN table2
	--	ON table1.column = table2.column

	--SELECT suppliers.supplier_id, suppliers.supplier_name, orders.order_date
	--	FROM suppliers 
	--	FULL OUTER JOIN orders
	--	ON suppliers.supplier_id = orders.supplier_id;

-- CROSS JOIN
	--	SELECT *
	--	FROM A
	--	CROSS JOIN B
	-- # of rows in the output = # from A * # Jrows from B

-- SELF JOIN
	--SELECT E.EmployeeId, E.Name AS 'Employee Name', 
	--	M.Name AS 'Manager Name'
	--	FROM Employee E 
	--	INNER JOIN Employee M 
	--	ON M.EmployeeId = E.ManagerI

--Set Operators : UNION (combined data into new rows & Remove duplicate), UNION ALL (combined rows & do not remove duplicate),INTERSECT ,EXCEPT 
	--	table must have same number of colums
	--	data type must match each other

	--		SELECT columns 
	--		FROM tableA
	--		WHERE
	--	UNION [ALL] / UNION / EXCEPT / INTERSECT
	--		SELECT columns 
	--		FROM tableB
	--		WHERE
	-- ORDER BY

