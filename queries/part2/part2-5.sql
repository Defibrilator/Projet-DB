--What are the names of countries (excluding Switzerland!) where the publishers have published series, for those 
--publishers who published at least one series in Switzerland. 
--Output schema: {Country Name}


SELECT DISTINCT sc.NAME AS "Country Name"
FROM STDDATA_COUNTRY sc, GCD_SERIES gs
WHERE gs.COUNTRY_ID = sc.ID AND NOT sc.NAME = 'Switzerland'  AND gs.PUBLISHER_ID in (
    SELECT gs.PUBLISHER_ID 
    FROM GCD_SERIES gs 
    WHERE gs.COUNTRY_ID IN (
        SELECT sc2.ID
        FROM STDDATA_COUNTRY sc2
        WHERE sc2.NAME = 'Switzerland'
        )
    )


-- RESULT --
--Country Name
-------------------------------------
--Netherlands
--Germany
--France