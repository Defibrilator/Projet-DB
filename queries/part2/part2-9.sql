--Related to question 8: we are interested in the breakdown of the number of such occurrences of publishers/series 
--per country. Order the output by the number of occurrences descending. 
--Output schema: {Country Name, Number} 

SELECT sc.NAME  AS "Country Name", COUNT(gp.ID) AS "Number"
FROM GCD_PUBLISHER gp, STDDATA_COUNTRY sc 
WHERE sc.ID = gp.COUNTRY_ID AND gp.ID IN (
    SELECT gs.PUBLISHER_ID 
    FROM GCD_SERIES gs 
    WHERE NOT gs.COUNTRY_ID = gp.COUNTRY_ID 
)
GROUP BY sc.NAME  
ORDER BY COUNT(gp.ID) DESC



-- RESULT --

--Country Name                        |Number|
--------------------------------------+------+
--United States                       |    41|
--Canada                              |    16|
--United Kingdom                      |    12|
--Belgium                             |     9|
--France                              |     8|
--Switzerland                         |     6|
--Netherlands                         |     5|
--Denmark                             |     4|
--Spain                               |     4|
--Germany                             |     4|
--Australia                           |     4|
--Italy                               |     3|
--Chile                               |     3|
--Sweden                              |     3|
--Japan                               |     2|
--Brazil                              |     2|
--Luxembourg                          |     1|
--Portugal                            |     1|
--Norway                              |     1|
--German Democratic Republic [former] |     1|
--Argentina                           |     1|
--Austria                             |     1|
--Ireland                             |     1|
--Colombia                            |     1|
--Serbia                              |     1|
--Singapore                           |     1|
--Czech Republic                      |     1|
--Kuwait                              |     1|
--------------------------------------+------+