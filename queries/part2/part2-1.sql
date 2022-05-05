--For each of the 10 publishers that began publishing first (the first 10 based on the year – limit the top 10 in the
--query even if there are ties), display in how many languages each of them published series in.
--Output schema: {Publisher Name, Series Language Count} 

SELECT P.NAME AS "Publisher Name", COUNT(DISTINCT gs.LANGUAGE_ID)  AS "Series Language Count"
FROM GCD_SERIES gs ,
	(	SELECT gp.name AS NAME, gp.id AS ID 
		FROM GCD_PUBLISHER gp 
		ORDER BY gp.YEAR_BEGAN ASC 
		FETCH FIRST 10 ROWS ONLY ) P
WHERE P.ID = gs.PUBLISHER_ID 
GROUP BY P.NAME


							-- RESULT --

--Publisher Name                                  |Series Language Count|
--------------------------------------------------+---------------------+
--Sdu Uitgevers                                   |                    1|
--Exshaw                                          |                    1|
--Turner                                          |                    1|
--Schlütersche Verlagsgesellschaft                |                    2|
--Humphrey                                        |                    1|
--Editorial Ibis Lda. / Livraria Bertrand S.A.R.L.|                    1|
--Verlag C. H. Beck                               |                    1|
--Schwabe                                         |                    1|
--Livraria Bertrand Lda.                          |                    1|
--Wilhelm Prym Werke                              |                    1|
--------------------------------------------------+---------------------+