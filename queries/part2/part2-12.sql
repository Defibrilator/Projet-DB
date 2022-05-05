--We are interested in the top 10 countries based on the publisher(s) with the longest time publishing, meaning the
--longest duration between the year they began and ended publishing. Take into consideration the year range
--between and including 1600 for the year began and 2020 for the year ended (both included). Display for those
--countries the longest duration of publisher publishing, as well as the average duration of publishing. Order the top
--10 countries by the maximum duration descending (highest first).
--Output schema: {Country Name, Max Years Publishing Per Country, Average Years Per Country} 


SELECT sc.NAME AS "Country Name", MAX(D.DUR) AS "Max Years Publishing Per Country", 
			ROUND(AVG(D.DUR), 3) AS "Average Years Per Country"
FROM STDDATA_COUNTRY sc, (	
		SELECT gp.COUNTRY_ID AS ID, gp.YEAR_ENDED - gp.YEAR_BEGAN AS DUR
		FROM GCD_PUBLISHER gp 
		WHERE gp.YEAR_BEGAN >= 1600 AND gp.YEAR_ENDED <= 2000 ) D
WHERE sc.ID = D.ID
GROUP BY sc.NAME 
ORDER BY "Max Years Publishing Per Country" DESC 
FETCH FIRST 10 ROWS ONLY
	 

							-- RESULT --

--Country Name  |Max Years Publishing Per Country|Average Years Per Country|
----------------+--------------------------------+-------------------------+
--Germany       |                             194|                       16|
--Australia     |                             159|                   14.852|
--United Kingdom|                             156|                     5.18|
--France        |                             150|                   17.368|
--United States |                             142|                    3.514|
--Belgium       |                             129|                    9.711|
--Netherlands   |                             110|                    6.453|
--Switzerland   |                             109|                   31.727|
--Spain         |                              76|                   16.714|
--Brazil        |                              70|                     19.6|
----------------+--------------------------------+-------------------------+