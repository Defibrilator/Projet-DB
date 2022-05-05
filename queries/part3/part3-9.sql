--Related to question 8: we are interested in the counts of years of the PUBLICATION_DATE field of GCD_ISSUE table
--in different formats. To limit the scope of this question, write a SQL query that returns the count of years in given
--formats, in this order: ‘DD/MM/YYYY’, ‘MM/DD/YYYY’, ‘MONTH YYYY’. Return the result in a single line, with 3
--columns (one for each format), and a single row (only one value, the count, per column).
--Hint: You will find useful the Oracle documentation on TO_DATE function, as well as using the default null on
--conversion error in to_date function to handle the formatting errors. Note that COUNT(*) returns all the rows,
--including null values, while COUNT(with_specified_column) does not count null values – so you can omit the null
--check in the where clause in that case, if sufficient as a check. Recall that you can use subqueries to simulate multiple
--input tables to achieve the required output.
--Output schema: {COUNT ‘DD/MM/YYYY’, COUNT ‘MM/DD/YYYY’, COUNT ‘MONTH YYYY’}


SELECT COUNT(F.VAL1) AS "COUNT ‘DD/MM/YYYY’", COUNT(F.VAL2) AS "COUNT ‘MM/DD/YYYY’", COUNT(F.VAL3) AS "COUNT ‘MONTH YYYY’"
FROM (	SELECT TO_DATE(gi.PUBLICATION_DATE DEFAULT NULL ON CONVERSION ERROR, 'DD/MM/YYYY') AS VAL1,
			TO_DATE(gi.PUBLICATION_DATE DEFAULT NULL ON CONVERSION ERROR, 'MM/DD/YYYY') AS VAL2,
			TO_DATE(gi.PUBLICATION_DATE DEFAULT NULL ON CONVERSION ERROR, 'MONTH YYYY') AS VAL3
		FROM GCD_ISSUE gi ) F


						-- RESULT --
		
--COUNT ‘DD/MM/YYYY’|COUNT ‘MM/DD/YYYY’|COUNT ‘MONTH YYYY’|
--------------------+------------------+------------------+
--             18851|              3969|            217642|
--------------------+------------------+------------------+