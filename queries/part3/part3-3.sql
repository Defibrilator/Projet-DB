--We are interested in the brand group names with more than 100 indicia publishers under the brand group. Display
--the brand group name and the corresponding count.
--Output schema: {Brand Group Name, Count} 

SELECT GBG.name AS "Brand Group Name", C.cnt AS "Count"
FROM GCD_BRAND_GROUP gbg , (
		SELECT gip2.PUBLISHER_ID AS ID, COUNT(gip2.ID) AS cnt
		FROM GCD_INDICIA_PUBLISHER gip2, GCD_BRAND_GROUP gbg2
		WHERE gip2.PUBLISHER_ID = gbg2.PUBLISHER_ID
		GROUP BY gip2.PUBLISHER_ID) C
WHERE gbg.PUBLISHER_ID = C.ID AND C.cnt > 100


							-- RESULT -- (first 20)

--Brand Group Name                                                                 |Count|
-----------------------------------------------------------------------------------+-----+
--Harvey Comics                                                                    |  378|
--HB                                                                               |  144|
--Helix                                                                            | 1012|
--Hernandez Production                                                             |  195|
--Hero Premiere Edition                                                            |  182|
--Hjemmet                                                                          |  300|
--Hjemmet; Hjemmets Bokforlag                                                      |  300|
--Hjemmet; Hjemmets Bokforlag a.s.                                                 |  300|
--Hjemmets Bokforlag                                                               |  300|
--Hjemmets Forlag                                                                  |  300|
--Homage Comics                                                                    | 1012|
--Homage Comics                                                                    |  300|
--Bongo Comics Group; Dino                                                         |  231|
--Bongo Comics Group; Panini                                                       |  231|
--Bravura                                                                          |  182|
--Charlton                                                                         |  120|
--Cliffhanger!                                                                     | 1012|
--Cliffhanger!                                                                     |  300|
--CMX                                                                              | 1012|
--Colección Trazado [versión del 2000]                                             |  300|
-----------------------------------------------------------------------------------+-----+