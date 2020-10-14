SELECT *
FROM homegames
WHERE year = '2016';

SELECT parks.park_name,homegames.park, team, attendance,games, (attendance/games) AS average_attendance
FROM homegames 
INNER JOIN parks
ON homegames.park = parks.park
WHERE games > 10
	AND year = '2016'
ORDER BY average_attendance DESC
LIMIT 5;

SELECT parks.park_name,homegames.park, team, attendance,games, (attendance/games) AS average_attendance
FROM homegames 
INNER JOIN parks
ON homegames.park = parks.park
WHERE games > 10
	AND year = '2016'
ORDER BY average_attendance 
LIMIT 5;