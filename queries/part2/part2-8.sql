--What are the names of the publishers who published at least one series in a country different from where they are 
--based? Sort the names in ascending order. 
--Output schema: {Publisher Name} 

SELECT gp.NAME AS "Publisher Name"
FROM GCD_PUBLISHER gp 
WHERE gp.ID IN (
    SELECT gs.PUBLISHER_ID 
    FROM GCD_SERIES gs 
    WHERE NOT gs.COUNTRY_ID = gp.COUNTRY_ID 
)
ORDER BY gp.NAME ASC


-- RESULT --

--Publisher Name                  
-------------------------------------
--AK Press
--APComics
--Abiogenesis Press
--Acme Press
--Agência Portuguesa de Revistas
--Aircel Publishing
--Alpen Publishers
--Amigo
--Andina
--Apocalypse
--Associated Newspapers
--Atomeka Press
--Azeko
--BSV - Williams
--Beeld Beeld
--Beta Publications
--Bich
--Bloomsbury
--British Petroleum (BP)
--Burnside