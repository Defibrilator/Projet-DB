--We are interested in the number of series per year they started being published, for the year range [1990-2017]
--(including 1990 and 2017). Sort the output based on the year, descending.
--Output schema: {Number of Series, Year Began}

SELECT COUNT(gs.ID) AS "Number of Series", gs.YEAR_BEGAN AS "Year Began"
FROM GCD_SERIES gs 
WHERE gs.YEAR_BEGAN >= 1990 AND gs.YEAR_BEGAN <= 2017
GROUP BY gs.YEAR_BEGAN 
ORDER BY gs.YEAR_BEGAN DESC 


-- RESULT --

--Number of Series|Year Began|
------------------+----------+
--             172|      2017|
--            3185|      2016|
--            3421|      2015|
--            3401|      2014|
--            3390|      2013|
--            3217|      2012|
--            3473|      2011|
--            3519|      2010|
--            3180|      2009|
--            3128|      2008|
--            3039|      2007|
--            2895|      2006|
--            2771|      2005|
--            2414|      2004|
--            2330|      2003|
--            2118|      2002|
--            2002|      2001|
--            2033|      2000|
--            1995|      1999|
--            2070|      1998|
--            2208|      1997|
--            2272|      1996|
--            2334|      1995|
--            2232|      1994|
--            2232|      1993|
--            2156|      1992|
--            1985|      1991|
--            1849|      1990|
------------------+----------+