--------------------SEASON 1 ---------------------------
--------------------Insights على مستوى اللاعبين---------
-----------------------GOALS---------------------------
CREATE VIEW season_1_goals AS(
SELECT   p.player_name,s.season_id ,sum(pg.goals) AS total_goals 
FROM dbo.player p 
JOIN dbo.player_goals pg 
ON p.player_id = pg.player_id
JOIN dbo.season s 
ON s.season_id= pg.season_id
WHERE s.season_id = 1
GROUP BY p.player_name,s.season_id
);
----------------------------------------
--ORDER BY total_goals DESC;
CREATE VIEW top_scorer AS
select TOP 1 total_goals  , player_name  from season_1_goals
ORDER BY total_goals DESC;
SELECT * FROM top_scorer;
------------------------------------------------

-----------------------------------------------------------------------------
 -----------------------TOP 3 PLAYERS GOALS----------------------------
CREATE VIEW top_3_goals_players AS
SELECT  TOP 3 p.player_name,s.season_id ,sum(pg.goals) AS total_goals 
FROM dbo.player p 
JOIN dbo.player_goals pg 
ON p.player_id = pg.player_id
JOIN dbo.season s 
ON s.season_id= pg.season_id
WHERE s.season_id=1
GROUP BY p.player_name,s.season_id
ORDER BY total_goals DESC;

---------------------------------------------------------------------------
-----------------------TOP 3 PLAYERS ASSISTS----------------------------
 CREATE VIEW top_3_assists_players AS
 SELECT TOP 3 pa.player_name ,s.season_id, SUM(pa.assists) AS total_assists  
  FROM dbo.player_assists pa
  JOIN dbo.season s
  ON s.season_id=pa.season_id
  WHERE s.season_id = 1
  GROUP BY pa.player_name ,s.season_id
  ORDER BY total_assists DESC;
  -------------------------------
  CREATE VIEW top_assists AS
select TOP 1 total_assists  , player_name  from top_3_assists_players
ORDER BY total_assists DESC;
SELECT * FROM top_assists;
-----------------------------------------------------------------------------
--------------------MOST_PLAYED-------------------------------
CREATE VIEW total_matches AS
SELECT p.player_name ,pss.season_id , sum(pss.Matches_played) AS total_played_matches 
FROM dbo.player p
JOIN dbo.player_stats_season pss 
ON p.player_id=pss.player_id
WHERE pss.season_id = 1 
GROUP BY p.player_name , pss.season_id;
SELECT TOP 1 
    player_name, 
    total_played_matches
FROM total_matches
WHERE total_played_matches < (
    SELECT MAX(total_played_matches) 
    FROM total_matches
)
ORDER BY total_played_matches DESC;

-----------------------------------------------------------------------------
--------------------MOST_PLAYED-------------------------------
CREATE VIEW most_played AS
SELECT TOP 10  p.player_name ,pss.season_id , sum(pss.Matches_played) AS total_played_matches 
FROM dbo.player p
JOIN dbo.player_stats_season pss 
ON p.player_id=pss.player_id
WHERE pss.season_id = 1 
GROUP BY p.player_name , pss.season_id
ORDER BY total_played_matches DESC ; 
----------------------------GOALS PER MTCHES---------------
CREATE VIEW goals_per_match AS
SELECT TOP 3
    p.player_id,
    p.player_name,
    s.season_id,
    CAST(
        SUM(pg.goals) * 90.0 / NULLIF(SUM(pss.minutes_played), 0)
        AS DECIMAL(10,3)
    ) AS goals_per_90
FROM player_stats_season pss
JOIN player p 
    ON p.player_id = pss.player_id
JOIN player_goals pg
    ON p.player_id = pg.player_id
    AND pss.season_id = pg.season_id
JOIN season s 
    ON pg.season_id = s.season_id 
WHERE s.season_id = 1
GROUP BY 
    p.player_id,
    p.player_name,
    s.season_id
	ORDER BY goals_per_90 DESC;
------------------------CLEAN SHEET--------------------------------
CREATE VIEW clean_sheet_record AS
SELECT TOP 1 c.player_id , p.player_name , c.clean_sheet_count 
FROM dbo.clean_sheet c
JOIN player p 
ON c.player_id = p.player_id
WHERE c.season_id = 1;
------------------------MOST RED --------------------------------

CREATE VIEW most_red_card_player AS  
SELECT  TOP 1 p.player_name , 
       SUM(dr.red_card) AS total_red_cards
	   FROM dbo.player p 
	   JOIN dbo.Disciplinary_Record dr 
	   ON p.player_id = dr.player_id 
	   WHERE season_id = 1
	   GROUP BY p.player_name 
	   ORDER BY total_red_cards  DESC;
----------------------- YELLOW CARD-----------------------------
CREATE VIEW most_yellow_card_player AS  
SELECT  TOP 1 p.player_name , 
       SUM(dr.yellow_card) AS total_yellow_cards
	   FROM dbo.player p 
	   JOIN dbo.Disciplinary_Record dr 
	   ON p.player_id = dr.player_id 
	   WHERE season_id = 1
	   GROUP BY p.player_name 
	   ORDER BY total_yellow_cards  DESC;
----------------------------- على مستوى الفريق-----------------------------
-----------------------GOALS---------------------------

CREATE VIEW total_teams_goals AS 
SELECT  s.season_id ,
       SUM(pg.goals) AS total_goals 
	   FROM dbo.player_goals pg 
	   JOIN dbo.season s 
	   ON s.season_id = pg.season_id 
	   WHERE s.season_id =1 
	   GROUP BY s.season_id ;
-----------------------ASSISTS---------------------------
	  CREATE VIEW total_teams_assists AS 
SELECT  s.season_id ,
       SUM(pa.assists) AS total_assits 
	   FROM dbo.player_assists pa
	   JOIN dbo.season s 
	   ON s.season_id = pa.season_id 
	   WHERE s.season_id =1 
	   GROUP BY s.season_id ; 
-------------------Goal Involvement---------------------------------------
CREATE VIEW G_A AS 
SELECT TOP 9 p.player_name , 
       SUM(pg.goals) AS total_goals,
	   SUM(pa.assists) AS total_assists,
	   SUM(pg.goals)+SUM(pa.assists) AS GA
	   FROM dbo.player p 
	   JOIN dbo.player_goals pg 
	   ON p.player_id = pg.player_id 
	   JOIN dbo.player_assists pa 
	   ON p.player_id = pa.player_id 
	   JOIN season s
	   ON s.season_id = pg.season_id AND s.season_id=pa.season_id
	   WHERE s.season_id = 1 
	   GROUP BY p.player_name
	   ORDER BY GA DESC;
	   SELECT TOP 1 * FROM G_A 
------------------------Conversion Rate---------------------------------
CREATE VIEW conversion_rate AS 
SELECT TOP 9 
    p.player_id,
    p.player_name,
    s.season_id,
    CAST(
        SUM(pg.goals) * 100.0 / NULLIF(SUM(ph.shots), 0)
        AS DECIMAL(10,2)
    ) AS conversion_rate
FROM dbo.player_goals pg
JOIN player p 
    ON p.player_id = pg.player_id
JOIN season s 
    ON pg.season_id = s.season_id
JOIN dbo.player_shots ph ON ph.player_id = p.player_id
WHERE s.season_id = 1
GROUP BY 
    p.player_id,
    p.player_name,
    s.season_id
	ORDER BY conversion_rate DESC;
-------------------------Top player by goal involvement----------------------------------------
CREATE VIEW Top_player_by_goal_involvement AS 
SELECT TOP 5 * 
FROM G_A
ORDER BY GA DESC;
----------------Team goals per match-----------------------
SELECT 
    pss.season_id,
    SUM(pg.goals) AS total_goals,
    CAST(
        SUM(pg.goals) * 1.0 / NULLIF(SUM(pss.Matches_played), 0)
        AS DECIMAL(10,3)
    ) AS goals_per_match
FROM dbo.player_stats_season pss
JOIN dbo.player_goals pg 
    ON pg.player_id = pss.player_id
    AND pg.season_id = pss.season_id
WHERE pss.season_id = 1
GROUP BY 
    pss.season_id;
---------------------------------------------------------------
CREATE VIEW team_goals_per90 AS
SELECT 
    s.season_id,
    CAST(
        SUM(pg.goals) * 1.0 /
        NULLIF(MAX(pss.Matches_played), 0)
        AS DECIMAL(10,2)
    ) AS goals_per_match
FROM dbo.player_goals pg
JOIN dbo.season s 
	ON s.season_id = pg.season_id
JOIN dbo.player_stats_season pss 
	ON pg.player_id = pss.player_id 
	AND pg.season_id = pss.season_id
WHERE s.season_id = 1
GROUP BY s.season_id;

SELECT  goals_per_match,s.season_id
FROM  team_goals_per90
------------------------------------------
SELECT pa.player_name , sum(pa.assists) as total_assists ,
       sum(pg.goals) AS total_goals 
	   FROM dbo.player_assists pa
	   JOIN dbo.player_goals pg 
	   ON pa.player_id = pg.player_id
	   where pa.season_id=1
	   GROUP BY pa.player_name
	   


	