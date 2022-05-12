--What are the names of publishers from the Netherlands who are known to have operated/existed at least between 
--1995 and 2000 (both years are included in the range). Sort the publisher names in descending order (Z to A). 
--Output schema: {Publisher Name} 

SELECT gp.NAME AS "Publisher Name"
FROM GCD_PUBLISHER gp 
WHERE gp.YEAR_BEGAN <=1995 AND YEAR_ENDED >= 2000
AND gp.COUNTRY_ID IN (
    SELECT sc.ID
    FROM STDDATA_COUNTRY sc
    WHERE sc.NAME = 'Netherlands'
    )
ORDER BY gp.NAME DESC 


-- RESULT --

--Publisher Name                  
-------------------------------------
--Wolters-Noordhoff
--Wavery Productions
--Van Holkema & Warendorf
--Unie van Waterschappen
--Uitgeverij M
--Stivoro
--Stichting Propria Cures
--Nieuwsblad van het Noorden
--Mondria
--Maaike Hartjes
--Drukwerk
--De Vrijbuiter
--De Stripper
--De Banier
--DRoodkoopren knoop
--CIC
--Bzztôh
--Bee Dee
--Barbara Stok