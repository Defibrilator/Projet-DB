--Find Indicia Publishers that have published at least 400 single-issue series. Display their names and the count (of
--single-issue series), and order the result by the count descending. Remember that issues may have multiple
--instances with the same indicia publisher and series, and single-issue series are the ones that have exactly one such
--pair-value (indicia_publisher, series) occurrence in the issues.
--Output schema: {Indicia Publisher Name, Count} 

SELECT RES2.name AS "Indicia Publisher Name", RES2.CNT2 AS "Count"
FROM	(SELECT gip.NAME AS NAME, COUNT(RES.ID) AS CNT2
		FROM GCD_INDICIA_PUBLISHER gip , (
				SELECT I.ID AS ID, I.PID AS PID
				FROM (SELECT gi.ID AS ID, gi.INDICIA_PUBLISHER_ID AS PID, COUNT(gi.ID) AS CNT
					FROM GCD_SERIES gs, GCD_INDICIA_PUBLISHER gip, GCD_ISSUE gi 
					WHERE gi.SERIES_ID = gs.ID AND gi.INDICIA_PUBLISHER_ID = gip.ID
					GROUP BY gi.ID, gi.INDICIA_PUBLISHER_ID) I
				WHERE CNT = 1) RES
		WHERE gip.ID = res.PID
		GROUP BY gip.NAME) RES2
WHERE RES2.CNT2 > 400
ORDER BY RES2.CNT2 DESC 


						-- RESULT -- (first 20)

--Indicia Publisher Name                                          |Count|
------------------------------------------------------------------+-----+
--DC Comics                                                       |28493|
--Marvel Comics                                                   |16440|
--Marvel Worldwide Inc.                                           |14702|
--Marvel Comics Group                                             |10702|
--D.C. Thomson & Co. Ltd                                          |10589|
--DC Comics Inc.                                                  | 9482|
--Aguiar & Dias Lda                                               | 7347|
--IDW Publishing                                                  | 6840|
--IPC Magazines Ltd.                                              | 6824|
--Image Comics Inc.                                               | 6750|
--Dynamite Entertainment                                          | 6227|
--Archie Comic Publications Inc.                                  | 5778|
--Marvel Publishing Inc.                                          | 5318|
--Western Publishing Company Inc.                                 | 5296|
--Bastei-Verlag Gustav H. Lübbe                                   | 5102|
--Dell Publishing Co. Inc.                                        | 4913|
--Dark Horse Comics Inc.                                          | 4910|
--Editormex Mexicana S.A.                                         | 4739|
--Egmont Serieforlaget AS                                         | 4690|
--National Periodical Publications Inc.                           | 4667|
------------------------------------------------------------------+-----+