-- 1
Select Max(yearid), min(yearid)
From teams; 

--Answer 1871 - 2016

-- 3 

SELECT namefirst, namelast, salary, schoolname
FROM salaries as s
INNER JOIN people AS p 
on s.playerid=p.playerid 
INNER JOIN collegeplaying as c
on c.playerid=s.playerid
INNER JOIN schools as sc
ON sc.schoolid=c.schoolid
WHERE schoolname = 'Vanderbilt University'
ORDER BY salary DESC;

-- Answer David Price, 30 Million