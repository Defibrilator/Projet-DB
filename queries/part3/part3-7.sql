--Which heroes are featured in stories (feature attribute) that have all three genres: humor, crime, and romance.
--Output schema: {Feature}

SELECT DISTINCT gs.FEATURE AS "Feature"
FROM GCD_STORY gs
WHERE EXISTS (
    SELECT *
    FROM GCD_STORY_TO_GENRE gstg 
    WHERE gs.ID = gstg.STORY_ID  AND gstg.GENRE_ID IN (
        SELECT gsg.ID 
        FROM GCD_STORY_GENRE gsg 
        WHERE gsg.GENRE = 'humor'
    )
)
AND EXISTS (
    SELECT *
    FROM GCD_STORY_TO_GENRE gstg 
    WHERE gs.ID = gstg.STORY_ID  AND gstg.GENRE_ID IN (
        SELECT gsg.ID 
        FROM GCD_STORY_GENRE gsg 
        WHERE gsg.GENRE = 'crime'
    )
)
AND EXISTS (
    SELECT *
    FROM GCD_STORY_TO_GENRE gstg 
    WHERE gs.ID = gstg.STORY_ID  AND gstg.GENRE_ID IN (
        SELECT gsg.ID 
        FROM GCD_STORY_GENRE gsg 
        WHERE gsg.GENRE = 'romance'
    )
)

-- RESULT --

--Feature                
-------------------------------------
--Family Funnies
--Dick Tracy