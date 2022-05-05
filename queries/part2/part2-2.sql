--Display the publisher names that have published more than 500 series, along with the number of series. Show the
--result in descending order of the count of published series.
--Output schema: {Publisher Name, Series Count}

SELECT gp.name AS "Publisher Name", COUNT(gs.id) AS "Series Count"
FROM GCD_PUBLISHER gp, GCD_SERIES gs 
WHERE gs.PUBLISHER_ID = gp.ID AND 500 < (
		SELECT COUNT(gs2.id)
		FROM GCD_SERIES gs2
		WHERE gs2.PUBLISHER_ID = gp.ID )
GROUP BY gp.name 
ORDER BY COUNT(gs.id) DESC 
		
		
			-- RESULT --

--Publisher Name        |Series Count|
------------------------+------------+
--Marvel                |        7628|
--DC                    |        6993|
--Dark Horse            |        2741|
--Image                 |        2080|
--Panini Deutschland    |        1811|
--Fantagraphics         |        1385|
--Egmont Ehapa          |        1364|
--IDW                   |        1344|
--Carlsen Comics [DE]   |        1282|
--Hjemmet / Egmont      |         947|
--Planeta DeAgostini    |         801|
--Panini España         |         728|
--Viz                   |         703|
--Tokyopop (de)         |         669|
--Western               |         653|
--Boom! Studios         |         584|
--Dynamite Entertainment|         579|
--Malibu                |         572|
--Dupuis                |         562|
--Arboris               |         561|
--Antarctic Press       |         546|
--Dell                  |         518|
--Editora Abril         |         514|
------------------------+------------+