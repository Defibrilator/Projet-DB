--For every country that has at least 200 publishers (based on Publisher Country location, they don’t need to have
--published any series, and the series they published can be in other countries than the Publisher Country), print the
--top 2 publishers by the number of series published (in any country, do not enforce that the series country is the
--same as publisher country).
--Hint: it is highly likely that you will need to use over/partition by, as well as filtering on row_number(). Break down
--the query into intermediate sub-tables, and check how to use over/partition by for top-k queries.
--Output schema: {Country Name, Publisher Name} 

