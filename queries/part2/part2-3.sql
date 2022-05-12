--Find the names of all series of publication type book published in Switzerland. Order the resulting names
--alphabetically (ascending, A to Z).
--Output schema: {Series Name}

SELECT gs.NAME AS "Series Name"
FROM GCD_SERIES gs 
WHERE gs.PUBLICATION_TYPE_ID IN (
			SELECT gspt.ID 
			FROM GCD_SERIES_PUBLICATION_TYPE gspt
			WHERE gspt.NAME = 'book')
		AND gs.COUNTRY_ID IN (
			SELECT sc.ID 
			FROM STDDATA_COUNTRY sc
			WHERE sc.CODE = 'ch')
ORDER BY gs.NAME ASC 

-- RESULT -- (21 results)

--Series Name                                         |
------------------------------------------------------+
--120 Rue de la Gare                                  |
--25 images de la passion d'un homme                  |
--Affentheater                                        |
--Alack Sinner                                        |
--Alans Kindheit                                      |
--Alans Krieg                                         |
--Das Geheimnis des Würgers                           |
--Den Letzten beissen die Hunde                       |
--Der Fotograf                                        |
--Die Reportage                                       |
--Ein Leben in China                                  |
--Elender Krieg  - Gesamtausgabe                      |
--Family Living                                       |
--Gaza                                                |
--Golem im Emmental                                   |
--Jetzt kommt später                                  |
--Le Soleil                                           |
--Palästina                                           |
--Victor Levallois                                    |
--Voyages et aventures surprenantes de Robinson Crusoé|
--Who killed Professor X?                             |
