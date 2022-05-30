--List all Marvel heroes that appear in Marvel-DC story crossovers. Marvel and DC are considered to be (parts of)
--Indicia Publisher names, and the heroes are described in the story feature attribute. Therefore, we are interested
--in heroes that appear in purely Marvel stories (without DC) AND in the ones that have both Marvel and DC in the
--corresponding Indicia publisher name. When comparing strings, you must transform all the strings to lowercase
--(there is a corresponding function to use – check the documentation) and use partialstring matches – so for Marvel
--and DC you need to find Indicia Publishers that partially match ’marvel’ and ’dc’ anywhere in the string. Display
--distinct, lowercase hero/feature strings – but do not manually deduplicate them further. Make sure that in the final
--result once you combine purely Marvel heroes with crossover heroes, you match their names partially as well!
--Output schema: {Crossover Feature Heroes} 

SELECT feature AS "Crossover Feature Heroes"
FROM(
    SELECT DISTINCT gs.FEATURE feature 
    FROM GCD_STORY gs
    WHERE gs.ISSUE_ID IN(
        SELECT gi.ID 
        FROM GCD_ISSUE gi 
        WHERE gi.INDICIA_PUBLISHER_ID IN
        (
            SELECT gip.id 
            FROM GCD_INDICIA_PUBLISHER gip 
            WHERE lower(gip.NAME) LIKE '%marvel%' 
            AND lower(gip.NAME) LIKE '%dc%' 
        )
    )
)
WHERE EXISTS (
    SELECT *
    FROM GCD_STORY gs2 
    WHERE gs2.FEATURE = feature AND  gs2.ISSUE_ID IN(
        SELECT gi2.ID 
        FROM GCD_ISSUE gi2 
        WHERE gi2.INDICIA_PUBLISHER_ID IN
        (
            SELECT gip2.id 
            FROM GCD_INDICIA_PUBLISHER gip2
            WHERE lower(gip2.NAME) LIKE '%marvel%' 
        )
    )
)

-- RESULT --

--Crossover Feature Heroes                
-------------------------------------
--Superman; Spider-Man
--Batman
--Wizard of Oz
--Hulk
--Spider-Man
--Superman
--
--Teen Titans; X-Men
--Spider-Man; Superman
--Batman; Hulk
--X-Men; Teen Titans
--Kitty Pryde
--Joker
--New Teen Titans; X-Men
--Superman and Spider-Man
--Lex Luthor; Doctor Octopus