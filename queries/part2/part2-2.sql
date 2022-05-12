--Find the IDs and names of publishers who published at least one album-type series in the Italian language. Order
--the results by the ID, descending (highest first).
--Output schema: {Publisher ID, Publisher Name}

SELECT gp.ID AS "Publisher ID", gp.NAME AS "Publisher Name"
FROM GCD_PUBLISHER gp, GCD_SERIES gs 
WHERE gs.PUBLISHER_ID = gp.ID 
		AND gs.PUBLICATION_TYPE_ID IN (
						SELECT gspt.ID 
						FROM GCD_SERIES_PUBLICATION_TYPE gspt
						WHERE gspt.NAME = 'album')
		AND gs.LANGUAGE_ID IN (
						SELECT sl.ID 
						FROM STDDATA_LANGUAGE sl
						WHERE sl.CODE = 'it')
GROUP BY gp.ID, gp.NAME 
ORDER BY COUNT(gs.ID) DESC  

-- RESULT --

--Publisher ID|Publisher Name         |
--------------+-----------------------+
--        2693|Panini                 |
--       10349|RW Edizioni            |
--       10056|Bel-Ami Edizioni       |
--         969|Kappa Edizioni         |
--         324|Max Bunker Press       |
--       10963|Cliquot                |
--         397|Milano Libri Edizioni  |
--       10355|Andrea Leggeri         |
--        3166|Rizzoli                |
--         845|Edizioni BD            |
--         440|Edizioni LIsola Trovata|
--       10209|7even Age Entertainment|
--        4881|001 Edizioni           |
--         164|Sergio Bonelli Editore |
--         442|EPC                    |
--        1177|Bonelli-Dargaud        |