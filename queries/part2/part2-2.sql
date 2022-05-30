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
ORDER BY gp.ID DESC  

-- RESULT --

--Publisher ID|Publisher Name         |
--------------+-----------------------+
--       10963|Cliquot                |
--       10355|Andrea Leggeri         |
--       10349|RW Edizioni            |
--       10209|7even Age Entertainment|
--       10056|Bel-Ami Edizioni       |
--        4881|001 Edizioni           |
--        3166|Rizzoli                |
--        2693|Panini                 |
--        1177|Bonelli-Dargaud        |
--         969|Kappa Edizioni         |
--         845|Edizioni BD            |
--         442|EPC                    |
--         440|Edizioni LIsola Trovata|
--         397|Milano Libri Edizioni  |
--         324|Max Bunker Press       |
--         164|Sergio Bonelli Editore |