--Show the brand group names with the largest number of Belgian Indicia Publishers (Indicia Publisher’s country at
--least partially matches “Belgium”). Show the Brand Group Names and the resulting largest number.
--Output schema: {Brand Group Name, Largest Number of Belgian Indicia Publishers} 

SELECT GBG.name AS "Brand Group Name", C.cnt AS "Count"
FROM GCD_BRAND_GROUP gbg , (
		SELECT gip2.PUBLISHER_ID AS ID, COUNT(gip2.ID) AS cnt, GIP2.COUNTRY_ID AS COUNTRY
		FROM GCD_INDICIA_PUBLISHER gip2, GCD_BRAND_GROUP gbg2
		WHERE gip2.PUBLISHER_ID = gbg2.PUBLISHER_ID AND GIP2.COUNTRY_ID = (
												SELECT sc.ID  
												FROM STDDATA_COUNTRY sc 
												WHERE sc.name = 'Belgium')
		GROUP BY gip2.PUBLISHER_ID, GIP2.COUNTRY_ID) C
WHERE gbg.PUBLISHER_ID = C.ID
ORDER BY C.cnt DESC 

												
						-- RESULT -- (first 20)
												
--Brand Group Name                                       |Count|
---------------------------------------------------------+-----+
--Puceron                                                |  165|
--RepéRages Dupuis                                       |  165|
--Uitgeverij Dupuis                                      |  165|
--Vrije Vlucht                                           |  165|
--Dubbel Expresso Dupuis                                 |  165|
--Dupuis                                                 |  165|
--Dupuis; Pizza Hut                                      |  165|
--Éditions Dupuis                                        |  165|
--Mezzanine                                              |  165|
--Aire Libre                                             |  165|
--Expresso Dupuis                                        |  165|
--Graton                                                 |  165|
--Collectie Vrolijke Vlucht                              |  165|
--Ukje                                                   |  165|
--Spotlight                                              |  165|
--Uitgeverij Oranje                                      |   72|
--Millennium; M                                          |   72|
--Farao                                                  |   72|
--Blitz                                                  |   72|
--Uitgeverij Vinci                                       |   72|
---------------------------------------------------------+-----+