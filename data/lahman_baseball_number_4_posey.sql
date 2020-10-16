/*SELECT playerid,namefirst,namelast, namegiven
FROM people
GROUP BY playerid;*/

/*SELECT MIN(yearid)
FROM teams;

SELECT MAX(yearid)
FROM teams;*/

WITH fielding_group AS (SELECT playerid, pos, po AS putouts,
						CASE WHEN pos LIKE 'OF' 
								THEN 'Outfield'
		 					 WHEN pos LIKE 'SS' 
							   OR pos LIKE '1B' 
							   OR pos LIKE '2B' 
							   OR pos LIKE '3B' 
								THEN 'Infield'
		 					 WHEN pos LIKE 'P' 
							   OR pos LIKE 'C' 
								THEN 'Battery' END AS field_position
					   FROM fielding
					   WHERE yearid = '2016'
					   GROUP BY playerid,pos,po) 
SELECT field_position, SUM(putouts) AS putouts
FROM fielding_group
GROUP BY field_position
ORDER BY putouts DESC;
	
						
SELECT playerid, pos, po AS putouts,
						CASE WHEN pos LIKE 'OF' 
								THEN 'Outfield'
		 					 WHEN pos LIKE 'SS' 
							   OR pos LIKE '1B' 
							   OR pos LIKE '2B' 
							   OR pos LIKE '3B' 
								THEN 'Infield'
		 					 WHEN pos LIKE 'P' 
							   OR pos LIKE 'C' 
								THEN 'Battery' END AS field_position
					   FROM fielding
					   WHERE yearid = '2016'
					   GROUP BY playerid,pos,po; 