--Finally, related to the date format and extraction, display the total number of issues per year between 1965 and
--1975, including both years in the result. The year should be taken from PUBLICATION_DATE, with ‘MONTH YYYY’
--format. Display the results by years ascending (1965 to 1975).
--Output schema: {Count Per Year, Year} 

SELECT count(DISTINCT D1.ID) AS "Count Per Year", D1.YEA AS "Year"
FROM (	SELECT D.ID AS ID, EXTRACT(YEAR FROM D.DAT) AS YEA
		FROM (	SELECT gi.ID AS ID, TO_DATE(gi.PUBLICATION_DATE DEFAULT NULL ON CONVERSION ERROR, 'MONTH YYYY') AS DAT
				FROM GCD_ISSUE gi ) D
		WHERE EXTRACT(YEAR FROM D.DAT) IS NOT NULL 
		ORDER BY YEA ASC ) D1
WHERE D1.YEA >= 1965 AND D1.YEA <= 1975
GROUP BY D1.YEA
ORDER BY D1.YEA ASC 


	-- RESULT --

--Count Per Year|Year|
----------------+----+
--          1289|1965|
--          1489|1966|
--          1557|1967|
--          1263|1968|
--          1491|1969|
--          1487|1970|
--          1626|1971|
--          1884|1972|
--          2194|1973|
--          1872|1974|
--          2259|1975|
----------------+----+