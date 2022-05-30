--What are the titles of the stories that have been reprinted at least 30 times? Print the reprint count along with the
--title. Order the output by the reprint count descending (higher to lower).
--Output schema: {Story Title, Reprint Count}

SELECT gs.TITLE AS "Story Title" , cnt AS "Reprint Count"
FROM GCD_STORY gs, (
    SELECT gsr.ORIGIN_ID AS origin_id, count(*) AS cnt
    FROM GCD_STORY_REPRINT gsr 
    GROUP BY gsr.ORIGIN_ID
)
WHERE gs.ID = origin_id AND cnt >= 30
ORDER BY CNT DESC

-- RESULT --

--Story Title                                               |Reprint Count|
------------------------------------------------------------+-------------+
--Spaghetti Brothers - historien om søsknene Centobucchi    | 90
--Spider-Man!                                               | 52
--Verso l'ignoto                                            | 46
--Spider Man                                                | 43
--                                                          | 36
--The Fantastic Four!                                       | 35
--Le sortilège du haricot                                   | 34
--Le nain de Corneloup                                      | 34
--Spider-Man                                                | 33
--Flash of Two Worlds!                                      | 33
--Spider-Man vs. The Chameleon!                             | 32
--Is He Man or Monster or... Is He Both!                    | 32
--Out of the Darksome Hills                                 | 31
--The Chameleon Strikes!                                    | 30
