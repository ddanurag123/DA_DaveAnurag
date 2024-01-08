-- (1) Top 10 Run scorer in histry of ipl from 2008 to 2020

SELECT batsman, SUM(batsman_runs) Total_runs
FROM ipl_data.ipl_ball
GROUP BY batsman
ORDER BY SUM(batsman_runs) DESC 
LIMIT 10;

-- (2)Top 10 wicket tacker in histry of ipl from 2008 to 2020

SELECT bowler, SUM(is_wicket) Total_wickets
FROM ipl_data.ipl_ball
GROUP BY bowler
ORDER BY SUM(is_wicket) DESC 
LIMIT 10;

-- (3)best batting figgure in a single match

SELECT year(M.match_date) as match_year,B.batsman, SUM(B.batsman_runs) max_runs,B.batting_team,B.bowling_team
FROM ipl_data.ipl_ball AS B    
  JOIN ipl_data.ipl_matches AS M 
	  ON B.id=M.id 
GROUP BY B.id,B.batsman,B.batting_team,B.bowling_team,M.match_date
HAVING SUM(batsman_runs) >= 100
ORDER BY SUM(batsman_runs) DESC;

-- (4)BEST Bowling Figure in a single match

SELECT B.id,year(M.match_date) as match_year,B.bowler, SUM(B.is_wicket) max_wickets,
SUM(B.total_runs) AS run_conceded ,B.bowling_team,B.batting_team
FROM ipl_data.ipl_ball AS B    
  JOIN ipl_data.ipl_matches AS M 
	  ON B.id=M.id
GROUP BY B.id,B.bowler,B.batting_team,B.bowling_team,M.match_date
ORDER BY SUM(is_wicket) DESC,SUM(B.total_runs) ASC
LIMIT 100;

-- (5)Balls taken to hit century:

SELECT batsman,count(batsman)
FROM ipl_data.ipl_ball
GROUP BY batsman,id
HAVING SUM(batsman_runs) >= 100
ORDER BY count(batsman);

-- (6)Most Successful Team in 2008: Determine which team has won the most matches.
SELECT winner , count(winner)
FROM ipl_data.ipl_matches
WHERE YEAR(match_date) = 2008
GROUP BY winner
ORDER BY count(winner) DESC ;

SELECT winner , count(winner) total_win
FROM ipl_data.ipl_matches
GROUP BY winner
ORDER BY count(winner) DESC ;


-- (7)Matches where wictory marging is more than 100 runs

SELECT * FROM ipl_data.ipl_matches
WHERE result='runs' AND result_margin >=100;

-- (8)Matches where wictory is by 10 wiclets
 
SELECT * FROM ipl_data.ipl_matches
WHERE result='wickets' AND result_margin = 10;

-- (9)fetch all data where final scores of both team tied.

SELECT * FROM ipl_data.ipl_matches
WHERE result='tied'
ORDER BY match_date DESC;

-- (10)TOP 10 bolwer who conceded max extra runs.

SELECT bowler,SUM(extra_runs)
FROM ipl_data.ipl_ball
GROUP BY bowler 
ORDER BY SUM(extra_runs) DESC
LIMIT 10;

-- (11)Top 20 highest runs scored by which team on which year;

SELECT dISTINCT(A.id),YEAR(B.match_date) AS year,A.batting_team,A.bowling_team,
  SUM(A.total_runs) as score,B.venue,B.winner,B.result,B.result_margin
FROM ipl_data.ipl_ball as A
  JOIN ipl_data.ipl_matches as B
  ON A.id = B.id
GROUP BY A.id,A.batting_team,A.bowling_team,B.venue,B.winner,B.result_margin,B.match_date,B.result
ORDER BY SUM(A.total_runs) DESC
LIMIT 20;

-- (12)top 20  Lowest runs scored by which team on which year;

SELECT distinct(A.id),YEAR(B.match_date) AS year,A.batting_team,A.bowling_team,SUM(A.total_runs) as score,B.venue,B.winner,B.result,B.result_margin
FROM ipl_data.ipl_ball as A
JOIN ipl_data.ipl_matches as B
  ON A.id = B.id
GROUP BY A.id,A.batting_team,A.bowling_team,B.venue,B.winner,B.result_margin,B.match_date,B.result
ORDER BY SUM(A.total_runs) ASC
LIMIT 20;

-- (13)AVG  Batting Strike rate of each bastman (min 1000 runs)

SELECT batsman,(SUM(batsman_runs)/COUNT(batsman_runs)*100) AS strike_rate
FROM ipl_data.ipl_ball
GROUP BY batsman
HAVING SUM(batsman_runs)>= 1000
ORDER BY strike_rate DESC;

-- (14)number of matches won by each team in each season.

SELECT YEAR(match_date),winner, count(winner) AS Total_winning
FROM ipl_data.ipl_matches
GROUP BY winner,YEAR(match_date)
ORDER BY YEAR(match_date),count(winner) DESC ;

-- (15)Highest number of sixes by bastman.

SELECT batsman,COUNT(batsman_runs) Total_sixes
FROM ipl_data.ipl_ball
WHERE batsman_runs = 6
GROUP BY batsman
HAVING Total_sixes >= 200
ORDER BY  COUNT(batsman_runs) DESC;

-- (16)Highest number of FOURS by bastman.

SELECT batsman,COUNT(batsman_runs) Total_four
FROM ipl_data.ipl_ball
WHERE batsman_runs = 4
GROUP BY batsman
HAVING Total_four >= 200
ORDER BY  COUNT(batsman_runs) DESC;

-- (17)number of mateches where toss winner win the match

select COUNT(id) toal_win
FROM ipl_matches
where toss_winner=winner;

-- (18)who has taken maximum catches.

select fielder,count(is_wicket) as catch_taken
from ipl_data.ipl_ball
where dismissal_kind = 'caught'
group by fielder
having catch_taken >50
order by catch_taken desc;

-- (19)which batsman got out as run-out maximun time

select player_dismissed , count(is_wicket) as run_out
from ipl_data.ipl_ball
where dismissal_kind = 'run out'
group by player_dismissed
having run_out >= 10
order by count(is_wicket) desc;

-- (20)any player with max players of match award (MoM).

SELECT player_of_match,count(id) TOTAL_MoM
 FROM ipl_data.ipl_matches
 GROUP BY player_of_match
 HAVING TOTAL_MoM > 10
 ORDER BY count(id) DESC;
 
 -- (21)number of matches played outside india.
 
 select count(id) match_outside
 from ipl_matches
 where neutral_venue = 1;
 
 -- (22)total matches played in each year.
 
 select year(match_date),count(id) total_matches
 from ipl_matches
 group by year(match_date);
 
 -- (23) in which month each season was played.
 
 select year(match_date) year,monthname(match_date) month,
 concat("Season","-",DENSE_RANK() over (order by year(match_date)) )as season
 from ipl_data.ipl_matches
 group by year(match_date),monthname(match_date);
 
 -- (24) total no. of ball played by each player.
 
 select A.batsman,count(B.id) total_balls
 from ipl_ball as A
 join ipl_matches as B
 on A.id=B.id
 group by A.batsman
order by count(B.id) desc;

-- (25)total matchs played by players
select batsman,count(distinct id) total_matches
 from ipl_ball 
 group by batsman
order by count(id) desc;

