--How many publishers have published series only in a country/countries different from the country they are in?  
--Output schema: {Number} 

SELECT count(*) AS "Number"
FROM (
    SELECT sc.NAME
    FROM GCD_PUBLISHER gp, STDDATA_COUNTRY sc 
    WHERE sc.ID = gp.COUNTRY_ID AND gp.ID IN (
        SELECT gs.PUBLISHER_ID 
        FROM GCD_SERIES gs 
        WHERE NOT gs.COUNTRY_ID = gp.COUNTRY_ID 
    )
    GROUP BY sc.NAME  
    HAVING COUNT(gp.ID) = 1 
)


-- RESULT --

--Number             
-------------------------------------
--12