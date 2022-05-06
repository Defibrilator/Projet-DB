--Display brand group names with the highest number of indicia publishers from the United States.
--Output schema: {Brand Group Name}

SELECT gbg.NAME AS "Brand Group Name"
FROM GCD_BRAND_GROUP gbg, GCD_INDICIA_PUBLISHER gip
WHERE gbg.PUBLISHER_ID = gip.PUBLISHER_ID AND gip.COUNTRY_ID IN (
			SELECT sc.ID
			FROM STDDATA_COUNTRY sc
			WHERE sc.code = 'us' OR sc.code = 'um')
GROUP BY gbg.NAME 
ORDER BY COUNT(gip.PUBLISHER_ID) DESC 


-- RESULT --

--Brand Group Name                     
-------------------------------------
--Marvel                               
--Disney Comics                        
--Malibu                               
--Shadowline                           
--Legendary                            
--2099                                 
--Crossgen                             
--Curtis Magazines                     
--Marvel Knights                       
--DBPRO                                
--A Romance! Magazine                  
--A Humorama Magazine                  
--M-Tech                               
--Star Comics                          
--Marvel; New Universe [white box]     
--Pizza Hut                            
--Midnight Sons                        
--Thumbtack                            
--Marvel Universe Fantastic Four Group 
--New Universe                         