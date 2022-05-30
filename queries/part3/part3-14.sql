--For every country that has at least 200 publishers (based on Publisher Country location, they don’t need to have
--published any series, and the series they published can be in other countries than the Publisher Country), print the
--top 2 publishers by the number of series published (in any country, do not enforce that the series country is the
--same as publisher country).
--Hint: it is highly likely that you will need to use over/partition by, as well as filtering on row_number(). Break down
--the query into intermediate sub-tables, and check how to use over/partition by for top-k queries.
--Output schema: {Country Name, Publisher Name} 

SELECT sc.NAME AS "Country Name", publisher_name AS "Publisher Name"
FROM STDDATA_COUNTRY sc , (
    SELECT ROW_NUMBER() OVER(PARTITION BY gp.COUNTRY_ID ORDER BY cnt desc ) AS rown, gp.NAME AS publisher_name, gp.COUNTRY_ID AS COUNTRY_ID , cnt
    FROM GCD_PUBLISHER gp , (
        SELECT gs.PUBLISHER_ID, COUNT(gs.ID) AS cnt
        FROM GCD_SERIES gs 
        GROUP BY gs.PUBLISHER_ID 
    )
    WHERE gp.ID = PUBLISHER_ID AND gp.COUNTRY_ID IN (
        SELECT COUNTRY_ID 
        FROM (
            SELECT COUNTRY_ID, COUNT(gp.ID) cnt2
            FROM GCD_PUBLISHER gp 
            GROUP BY COUNTRY_ID 
        )
        WHERE CNT2 >= 200
    )
)
WHERE sc.ID = COUNTRY_ID AND rown <= 2
ORDER BY COUNTRY_ID


-- RESULT --

--Country Name    |Publisher Name               |
------------------+-----------------------------+
--Canada          |Drawn & Quarterly
--Canada          |Bell Features
--Germany         |Panini Deutschland
--Germany         |Egmont Ehapa
--Denmark         |Interpresse
--Denmark         |Forlaget Carlsen
--France          |Panini France
--France          |Dargaud éditions
--United Kingdom  |IPC
--United Kingdom  |Titan
--Italy           |Arnoldo Mondadori Editore
--Italy           |Sergio Bonelli Editore
--Netherlands     |Arboris
--Netherlands     |Oberon
--Norway          |Hjemmet / Egmont
--Norway          |Semic
--Sweden          |Semic
--Sweden          |Egmont
--United States   |Marvel
--United States   |DC