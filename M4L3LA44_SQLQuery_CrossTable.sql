--M4 LA44 Data Retrieval from Multiple Tables
use Chinook;
--1.For each track, return the following columns: DONE
--Track Name
--Track Length
--Album Title
--Artist Name
--Do not include tracks without a matching album or artist.
--Order the results by album id, ascending.

SELECT T.Name AS 'Track Name', T.Milliseconds AS 'Track Length',Al.Title AS 'Album Title', A.Name AS 'Artist Name'
	FROM Album AS Al
	INNER JOIN Track T  ON T.AlbumId = Al.AlbumId 
	INNER JOIN Artist A ON Al.ArtistId = A.ArtistId 
	ORDER BY Al.AlbumId ASC;


--2.For each track, return the following columns: DONE
--Track Name
--Track Unit Price
--Media Type Name
--Genre Name
--Do not include tracks without a matching genre type or media type. Order by genre name alphabetically
SELECT T.Name AS 'Track Name', T.UnitPrice AS 'Track Unit Price',M.Name AS 'Media Name', G.Name AS 'Genre Name'
	FROM Track AS T
	INNER JOIN MediaType M  ON T.MediaTypeId = M.MediaTypeId 
	INNER JOIN Genre G ON T.GenreId = G.GenreId 
	ORDER BY G.GenreId DESC;

--3. For each track that is not in playlist, return the following
--Track name
--Size in bytes

		SELECT T.TrackId
		FROM Track AS T
	EXCEPT
		SELECT P.TrackId 
		FROM PlaylistTrack P;
		--All tracks are in playlist

	SELECT T.Name AS 'Track Name', T.Bytes AS 'Size in bytes'
	FROM PlaylistTrack P 
	LEFT OUTER JOIN Track T 
	ON P.TrackId = T.TrackId
	WHERE PlaylistId IS NULL;
	--All tracks are in playlist

--4. For each employee who does not support a customer, return the following DONE
--First name
--Last name
	SELECT *
	FROM Employee

	SELECT *
	FROM Customer

	SELECT E.FirstName AS 'First name', E.LastName AS 'Last name'--,E.EmployeeId,C.CustomerID -- Employees  are all Customers
	FROM Employee E 
	LEFT OUTER JOIN Customer C 
	ON C.SupportRepId = E.EmployeeId
	WHERE CustomerId IS NULL 
	ORDER BY E.EmployeeId ASC;
	--ORDER BY 'First name' ASC;

--5. Return the following columns DONE
--Last name
--First name
--Phone number
--Return a row for each customer and a row for each employee in a single table
		SELECT C.FirstName AS 'First name', C.LastName AS 'Last name', C.Phone AS 'Phone number'
		FROM Customer AS C
	UNION
		SELECT E.FirstName AS 'First name', E.LastName AS 'Last name', E.Phone AS 'Phone number'
		FROM Employee AS E;

--6. Return the following columns DONE
--Name
--Name should contain a composer name or an artist name.
--Return a row for each artist and a row for each track that has a composer in a single table.
		SELECT A.Name AS 'Name'
		FROM Artist AS A
	UNION
		SELECT T.Name AS 'Name'
		FROM Track AS T

