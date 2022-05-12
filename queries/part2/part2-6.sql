--In which languages (names of languages, without duplicates) have the publishers located in Switzerland published 
--series located in countries other than, different from Switzerland.  
--Output schema: {Language Name} 

SELECT sl.NAME AS "Language Name"
FROM STDDATA_LANGUAGE sl 
WHERE sl.ID IN (
    SELECT gs.LANGUAGE_ID  
    FROM GCD_SERIES gs 
    WHERE gs.PUBLISHER_ID IN (
        SELECT gp.ID 
        FROM GCD_PUBLISHER gp 
        WHERE gp.COUNTRY_ID IN (
            SELECT sc.ID
            FROM STDDATA_COUNTRY sc
            WHERE sc.NAME = 'Switzerland'
            )
        )
    AND gs.COUNTRY_ID NOT IN (
        SELECT sc2.ID
        FROM STDDATA_COUNTRY sc2
        WHERE sc2.NAME = 'Switzerland'
        )
    )


-- RESULT --

--Language Name                  
-------------------------------------
--Dutch
--German
--French