--What is the most reprinted story for an issue? Display the issue ID, the story ID with the most reprints, and the
--corresponding reprint count. Sort the output based on the reprint count, and display the top 5 results. Count only
--the immediate reprints (the stories that match the origin ID).
--Output schema: {Issue ID, Story ID, Count} 

--For query 6 of part 3, we are interested in the most reprinted stories from any issue. In other words, we are interested 
--in the top-5 most reprinted stories (only immediate reprints) along with their issue ids and counts.

SELECT issue AS "Issue ID", story AS "Story ID", cnt AS "Count"
FROM (SELECT gs.ISSUE_ID AS issue, gs.ID AS story, cnt
FROM GCD_STORY gs, (
    SELECT gsr.ORIGIN_ID AS origin_id, count(*) AS cnt
    FROM GCD_STORY_REPRINT gsr 
    GROUP BY gsr.ORIGIN_ID
)
WHERE gs.ID = origin_id)
ORDER BY cnt DESC 
FETCH FIRST 5 ROWS ONLY 


--Issue ID|Story ID|Count|
----------+--------+-----+
--336676  |1419829 |90
--17099   |133435  |52
--555894  |1804115 |46
--17099   |133434  |43
--92510   |363431  |36