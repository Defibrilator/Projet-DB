--How many publishers have published series only in a country/countries different from the country they are in?  
--Output schema: {Number} 

SELECT count(*) AS "Number"
FROM (
    SELECT gp.NAME
    FROM GCD_PUBLISHER gp
    WHERE gp.ID IN (
        SELECT gs.PUBLISHER_ID 
        FROM GCD_SERIES gs 
        WHERE NOT gs.COUNTRY_ID = gp.COUNTRY_ID 
    )
    AND NOT gp.ID IN (
        SELECT gs.PUBLISHER_ID 
        FROM GCD_SERIES gs 
        WHERE gs.COUNTRY_ID = gp.COUNTRY_ID 
    )
)

-- RESULT --

--Number             
-------------------------------------
--29