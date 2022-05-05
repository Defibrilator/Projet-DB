--Considering the PUBLICATION_DATE column in GCD_ISSUE table – it was kept as a string due to having a variety of
--date formats. Write a SQL query to extract the years from the PUBLICATION_DATE column that has a
--‘DD/MM/YYYY’ date format. Display the distinct years only once, in ascending order.
--Hint: You will find useful the Oracle documentation on TO_DATE function, extract function to get the particular
--part/value from the date, as well as using the default null on conversion error in to_date function to handle
--formatting issues that happen since other date formats exist in the data and for some the matching will fail –
--therefore instead of failing to return a null value.
--Output schema: {Extracted Year Values} 


SELECT DISTINCT EXTRACT(YEAR FROM D.VAL) AS "Extracted Year Values"
FROM (	SELECT TO_DATE(gi.PUBLICATION_DATE DEFAULT NULL ON CONVERSION ERROR, 'DD/MM/YYYY') AS VAL
		FROM GCD_ISSUE gi ) D
WHERE EXTRACT(YEAR FROM D.VAL) IS NOT NULL 
ORDER BY "Extracted Year Values" ASC 


	-- RESULT -- (first 20 only)

--Extracted Year Values|
-----------------------+
--                   15|
--                   22|
--                   56|
--                   57|
--                   69|
--                   71|
--                   77|
--                   82|
--                   88|
--                   91|
--                 1825|
--                 1826|
--                 1830|
--                 1831|
--                 1832|
--                 1834|
--                 1835|
--                 1888|
--                 1890|
--                 1893|