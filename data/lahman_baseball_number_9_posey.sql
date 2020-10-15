/*SELECT *
FROM peopleFROM people
JOIN appearances
ON people.playerid = appearances.playerid
JOIN teams
ON teams.teamid = appearances.teamid
JOIN managers;

SELECT CONCAT(people.namefirst, people.namelast), teams.name
FROM people;

SELECT people.namegiven, teams.name​,
awardsmanager.lgid, awardsmanager.awardid
FROM people
JOIN appearances
ON people.playerid = appearances.playerid
JOIN teams
ON teams.teamid = appearances.teamid
JOIN managers
ON people.playerid = managers.playerid
JOIN managers
ON awardsmanagers.playerid = managers.playerid
WHERE awardid ILIKE '&tsn&';

WITH tsn_winners AS (SELECT playerid, awardid, yearid, lgid
					FROM awardsmanagers
					WHERE awardid ILIKE '&tsn&';
					--AND lgid = 'AL';
SELECT playerid, yearid, lgid
FROM awardsmanagers
WHERE awardid ILIKE '&tsn&'
	AND lgid = 'NL';
UNION
SELECT playerid, teamid, yearid, lgid
FROM managers)
SELECT
FROM tsn_winners LEFT JOIN people
ON tsn_winners.playerid = people.playerid
FROM people
JOIN appearances
ON people.playerid = appearances.playerid
JOIN teams
ON teams.teamid = appearances.teamid;



SELECT *
FROM awardsmanagers;
--WHERE yearid = '2016'


SELECT  playerid, lgid
FROM awardsmanagers
WHERE awardid ILIKE '%tsn%'
	AND lgid = 'AL' AND lgid = 'NL';
	
WITH tsn_winners AS (SELECT playerid,awardid,yearid,lgid
					FROM awardsmanagers
					WHERE awardid ILIKE '%tsn%'
					AND lgid = 'AL'
					UNION
					SELECT playerid,awardid,yearid,lgid
					FROM awardsmanagers
					WHERE awardid ILIKE '%tsn%'
					AND lgid = 'NL';)
					--UNION
					--SELECT playerid,teamid,yearid,lgid
					--FROM managers;
SELECT tsn_winners.playerid, 
FROM tsn_winners LEFT JOIN people
USING (playerid);*/


/*SELECT playerid,awardid,yearid,lgid 
FROM awardsmanagers
WHERE awardid ILIKE '%tsn%';

SELECT playerid,yearid,teamid,lgid
FROM managers;

SELECT playerid, namefirst, namelast, namegiven
FROM people;

SELECT teamid, name, yearid, lgid
FROM teams;

SELECT playerid, yearid, teamid, lgid
FROM appearances;


manager_people AS 
manager_people_teams AS 
manager_people_teams_appearances AS 


WITH mp AS (SELECT managers.playerid AS playerid,teamid,lgid,yearid
			FROM managers
			INNER JOIN people
			ON managers.playerid = people.playerid),
	 mpt AS (SELECT mp.playerid AS playerid,mp.teamid,lgid,yearid
			 FROM mp
			 INNER JOIN teams
			 ON mp.teamid = teams.teamid),
	 mpta AS (SELECT mpt.playerid AS playerid,teamid, lgid, yearid
			  FROM mpt
			  INNER JOIN appearances
			  ON mpt.playerid = appearances.playerid),
	 mptaa AS (SELECT mpta.playerid AS playerid,awardid,yearid,lgid
			  FROM mpta
			  INNER JOIN awardsmanagers
			  ON mpta.playerid = awardsmanagers.playerid)
SELECT *
FROM mptaa
WHERE awardid ILIKe '%tsn%'
LIMIT 25;
			  
WITH tsn_winners AS (SELECT playerid, awardid, lgid
					FROM awardsmanagers
					WHERE awardid ILIKE '%TSN%'
					AND lgid NOT LIKE 'ML'
					ORDER BY playerid),
	 winners_both AS (SELECT tsn1.playerid AS playerid,tsn1.awardid,tsn1.lgid AS tsn1 ,tsn2.lgid AS tsn2
					  FROM tsn_winners AS tsn1 INNER JOIN tsn_winners AS tsn2
					  USING (playerid)
					  WHERE tsn1 != tsn2),
	 managers_name AS (SELECT (CONCAT(people.namefirst ,' ', people.namelast))as managers_names
	 		   		  FROM people)
SELECT teams.name
FROM people INNER JOIN winners_both 
		    ON people.playerid = winners_both.playerid,
	 teams JOIN appearances
		   ON teams.teamid = appearances.teamid;
 	 --people JOIN teams
		    --ON teams.teamid = appearances.teamid;*/
			
			
/*WITH award_winners AS (SELECT DISTINCT(a1.playerid), a1.awardid AS award,a1.yearid AS yearid, a1.lgid AS a1lgid, a2.lgid AS a2lgid 
					FROM awardsmanagers as a1 INNER JOIN awardsmanagers as a2
					USING(playerid)
					WHERE a1.awardid LIKE '%TSN%'
					AND a1.lgid LIKE 'NL'
					AND a2.lgid LIKE 'AL'),
	managers_info AS (SELECT CONCAT(people.namefirst ,' ', people.namelast)as managers_names, playerid
					FROM people)
SELECT DISTINCT(managers_info.managers_names), teams.name AS team_name, award_winners.award,award_winners.yearid, 
				concat(award_winners.a1lgid,award_winners.a2lgid)
					FROM managers_info
					JOIN award_winners
					ON managers_info.playerid = award_winners.playerid
					JOIN appearances
					ON award_winners.playerid = appearances.playerid
					JOIN teams
					ON teams.teamid = appearances.teamid
ORDER BY managers_names;*/

SELECT *
FROM awardsmanagers
WHERE awardid ILIKE '%tsn%'
AND lgid = 'NL' 
OR awardid ILIKE '%tsn%'
AND lgid = 'AL' 
ORDER BY playerid;



