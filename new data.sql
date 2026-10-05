-- ====================================
-- Real Madrid Database Insert Script
-- Seasons: 2015-16, 2016-17, 2017-18
-- ====================================

USE Real_Madrid;
GO

-- ====================================
-- 1. INSERT SEASONS
-- ====================================
INSERT INTO season (season_id, season_name, start_year, end_year) VALUES
(1, '2015-2016', '2015-07-01', '2016-06-30'),
(2, '2016-2017', '2016-07-01', '2017-06-30'),
(3, '2017-2018', '2017-07-01', '2018-06-30');

-- ====================================
-- 2. INSERT COACHES
-- ====================================
INSERT INTO coach (first_name, last_name) VALUES
('Rafael', 'Benítez'),
('Zinédine', 'Zidane');

-- ====================================
-- 3. INSERT COACH-SEASON RELATIONSHIPS
-- ====================================
INSERT INTO coach_season (coach_id, season_id, start_of_season, end_of_season) VALUES
(1, 1, '2015-07-01', '2016-01-04'),  -- Benítez
(2, 1, '2016-01-04', '2016-06-30'),  -- Zidane
(2, 2, '2016-07-01', '2017-06-30'),  -- Zidane
(2, 3, '2017-07-01', '2018-06-30');  -- Zidane

-- ====================================
-- 4. INSERT COACH ASSISTANTS
-- ====================================
INSERT INTO Coach_Assistant (coach_id, first_name, last_name, assistant_role) VALUES
(2, 'David', 'Bettoni', 'Assistant Coach'),
(2, 'Antonio', 'Pintus', 'Fitness Coach');

-- ====================================
-- 5. INSERT PLAYERS (Main Squad)
-- ====================================
INSERT INTO player (player_name, position, birth_date, nationality) VALUES
-- Goalkeepers
('Keylor Navas', 'GK', '1986-12-15', 'Costa Rica'),
('Kiko Casilla', 'GK', '1986-10-02', 'Spain'),
('Rubén Yáñez', 'GK', '1993-10-17', 'Spain'),

-- Defenders
('Sergio Ramos', 'DF', '1986-03-30', 'Spain'),
('Pepe', 'DF', '1983-02-26', 'Portugal'),
('Raphael Varane', 'DF', '1993-04-25', 'France'),
('Marcelo', 'DF', '1988-05-12', 'Brazil'),
('Dani Carvajal', 'DF', '1992-01-11', 'Spain'),
('Danilo', 'DF', '1991-07-15', 'Brazil'),
('Nacho Fernández', 'DF', '1990-01-18', 'Spain'),
('Alvaro Arbeloa', 'DF', '1983-01-17', 'Spain'),

-- Midfielders
('Luka Modrić', 'MF', '1985-09-09', 'Croatia'),
('Toni Kroos', 'MF', '1990-01-04', 'Germany'),
('Casemiro', 'MF', '1992-02-23', 'Brazil'),
('Isco', 'MF', '1992-04-21', 'Spain'),
('James Rodríguez', 'MF', '1991-07-12', 'Colombia'),
('Mateo Kovačić', 'MF', '1994-05-06', 'Croatia'),
('Lucas Vázquez', 'MF', '1991-07-01', 'Spain'),
('Marco Asensio', 'MF', '1996-01-21', 'Spain'),

-- Forwards
('Cristiano Ronaldo', 'FW', '1985-02-05', 'Portugal'),
('Karim Benzema', 'FW', '1987-12-19', 'France'),
('Gareth Bale', 'FW', '1989-07-16', 'Wales'),
('Jesé Rodríguez', 'FW', '1993-02-26', 'Spain'),
('Álvaro Morata', 'FW', '1992-10-23', 'Spain');

-- ====================================
-- 6. INSERT PLAYER-SEASON DATA (2015-16)
-- ====================================
-- Season 1: 2015-16
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value) VALUES
-- Goalkeepers
(1, 1, 1, 'Squad Player', 15000000),
(2, 1, 13, 'Squad Player', 3000000),
(3, 1, 25, 'Squad Player', 1000000),

-- Defenders
(4, 1, 4, 'Squad Player', 45000000),
(5, 1, 3, 'Squad Player', 12000000),
(6, 1, 2, 'Squad Player', 30000000),
(7, 1, 12, 'Squad Player', 35000000),
(8, 1, 15, 'Squad Player', 25000000),
(9, 1, 23, 'New Signing', 25000000),
(10, 1, 6, 'Squad Player', 10000000),
(11, 1, 17, 'Squad Player', 4000000),

-- Midfielders
(12, 1, 19, 'Squad Player', 50000000),
(13, 1, 8, 'Squad Player', 60000000),
(14, 1, 14, 'Returning', 15000000),
(15, 1, 22, 'Squad Player', 30000000),
(16, 1, 10, 'Squad Player', 50000000),
(17, 1, 16, 'Squad Player', 20000000),
(18, 1, 18, 'New Signing', 12000000),
(19, 1, 20, 'Squad Player', 8000000),

-- Forwards
(20, 1, 7, 'Squad Player', 120000000),
(21, 1, 9, 'Squad Player', 40000000),
(22, 1, 11, 'Squad Player', 90000000),
(23, 1, 21, 'Squad Player', 15000000),
(24, 1, 24, 'Squad Player', 12000000);

-- ====================================
-- 7. INSERT PLAYER STATS (2015-16)
-- ====================================
INSERT INTO player_stats_season (player_id, season_id, Matches_played, Assists, minutes_played) VALUES
-- Goalkeepers
(1, 1, 37, 0, 3330),
(2, 1, 11, 0, 990),
(3, 1, 2, 0, 180),

-- Defenders
(4, 1, 37, 3, 3195),
(5, 1, 28, 1, 2390),
(6, 1, 31, 2, 2680),
(7, 1, 36, 8, 3060),
(8, 1, 35, 7, 2975),
(9, 1, 23, 3, 1840),
(10, 1, 24, 1, 1680),
(11, 1, 15, 0, 900),

-- Midfielders
(12, 1, 35, 8, 2940),
(13, 1, 36, 12, 3060),
(14, 1, 33, 5, 2640),
(15, 1, 33, 6, 2475),
(16, 1, 29, 8, 2175),
(17, 1, 28, 4, 1680),
(18, 1, 25, 5, 1625),
(19, 1, 8, 1, 384),

-- Forwards
(20, 1, 36, 11, 3150),
(21, 1, 36, 4, 2880),
(22, 1, 23, 5, 1794),
(23, 1, 26, 3, 1300),
(24, 1, 14, 2, 560);

-- ====================================
-- 8. INSERT PLAYER GOALS (2015-16)
-- ====================================
INSERT INTO player_goals (player_id, season_id, competition, goals, penalties) VALUES
-- Cristiano Ronaldo
(20, 1, 'La Liga', 35, 7),
(20, 1, 'Champions League', 16, 2),
(20, 1, 'Copa del Rey', 0, 0),

-- Karim Benzema
(21, 1, 'La Liga', 24, 2),
(21, 1, 'Champions League', 4, 0),
(21, 1, 'Copa del Rey', 0, 0),

-- Gareth Bale
(22, 1, 'La Liga', 19, 1),
(22, 1, 'Champions League', 3, 0),
(22, 1, 'Copa del Rey', 0, 0),

-- Jesé
(23, 1, 'La Liga', 4, 0),
(23, 1, 'Champions League', 1, 0),

-- Lucas Vázquez
(18, 1, 'La Liga', 2, 0),
(18, 1, 'Champions League', 1, 0),

-- Isco
(15, 1, 'La Liga', 4, 0),
(15, 1, 'Champions League', 2, 0),

-- James
(16, 1, 'La Liga', 5, 0),
(16, 1, 'Champions League', 2, 0),

-- Sergio Ramos
(4, 1, 'La Liga', 5, 3),
(4, 1, 'Champions League', 2, 0),

-- Casemiro
(14, 1, 'La Liga', 2, 0),
(14, 1, 'Champions League', 1, 0);

-- ====================================
-- 9. INSERT DISCIPLINARY RECORDS (2015-16)
-- ====================================
INSERT INTO Disciplinary_Record (player_id, season_id, red_card, yellow_card) VALUES
(1, 1, 0, 2),
(2, 1, 0, 0),
(3, 1, 0, 0),
(4, 1, 2, 11),
(5, 1, 1, 9),
(6, 1, 0, 5),
(7, 1, 0, 7),
(8, 1, 0, 8),
(9, 1, 0, 6),
(10, 1, 0, 4),
(11, 1, 0, 2),
(12, 1, 0, 5),
(13, 1, 0, 3),
(14, 1, 0, 7),
(15, 1, 0, 4),
(16, 1, 0, 3),
(17, 1, 0, 2),
(18, 1, 0, 3),
(19, 1, 0, 1),
(20, 1, 0, 8),
(21, 1, 0, 4),
(22, 1, 0, 3),
(23, 1, 0, 2),
(24, 1, 0, 1);

-- ====================================
-- 10. INSERT CLEAN SHEETS (2015-16)
-- ====================================
INSERT INTO clean_sheet (player_id, season_id, clean_sheet_count) VALUES
(1, 1, 17),  -- Keylor Navas
(2, 1, 4),   -- Casilla
(3, 1, 0);   -- Yáñez

-- ====================================
-- 11. SEASON 2: 2016-17
-- ====================================
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value) VALUES
-- Goalkeepers
(1, 2, 1, 'Squad Player', 18000000),
(2, 2, 13, 'Squad Player', 3500000),

-- Defenders
(4, 2, 4, 'Squad Player', 50000000),
(5, 2, 3, 'Squad Player', 10000000),
(6, 2, 5, 'Squad Player', 35000000),
(7, 2, 12, 'Squad Player', 40000000),
(8, 2, 2, 'Squad Player', 28000000),
(9, 2, 23, 'Squad Player', 22000000),
(10, 2, 6, 'Squad Player', 12000000),

-- Midfielders
(12, 2, 10, 'Squad Player', 55000000),
(13, 2, 8, 'Squad Player', 65000000),
(14, 2, 14, 'Squad Player', 20000000),
(15, 2, 22, 'Squad Player', 35000000),
(16, 2, 11, 'Squad Player', 45000000),
(17, 2, 16, 'Squad Player', 25000000),
(18, 2, 17, 'Squad Player', 15000000),
(19, 2, 20, 'Squad Player', 12000000),

-- Forwards
(20, 2, 7, 'Squad Player', 100000000),
(21, 2, 9, 'Squad Player', 45000000),
(22, 2, 11, 'Squad Player', 80000000),
(24, 2, 21, 'Squad Player', 18000000);

-- Player Stats 2016-17
INSERT INTO player_stats_season (player_id, season_id, Matches_played, Assists, minutes_played) VALUES
(1, 2, 39, 0, 3510),
(2, 2, 9, 0, 810),
(4, 2, 38, 4, 3306),
(5, 2, 20, 0, 1560),
(6, 2, 35, 1, 3045),
(7, 2, 37, 10, 3145),
(8, 2, 38, 8, 3268),
(9, 2, 27, 4, 2106),
(10, 2, 28, 2, 2016),
(12, 2, 36, 9, 3060),
(13, 2, 37, 13, 3145),
(14, 2, 37, 6, 2849),
(15, 2, 35, 8, 2625),
(16, 2, 22, 9, 1518),
(17, 2, 32, 5, 1920),
(18, 2, 29, 10, 1885),
(19, 2, 33, 3, 1815),
(20, 2, 35, 12, 3045),
(21, 2, 35, 6, 2835),
(22, 2, 27, 7, 2079),
(24, 2, 31, 3, 1550);

-- Player Goals 2016-17
INSERT INTO player_goals (player_id, season_id, competition, goals, penalties) VALUES
(20, 2, 'La Liga', 25, 5),
(20, 2, 'Champions League', 12, 2),
(20, 2, 'Copa del Rey', 5, 1),
(21, 2, 'La Liga', 11, 1),
(21, 2, 'Champions League', 5, 0),
(21, 2, 'Copa del Rey', 3, 0),
(22, 2, 'La Liga', 7, 0),
(22, 2, 'Champions League', 2, 0),
(24, 2, 'La Liga', 15, 2),
(24, 2, 'Champions League', 5, 0),
(19, 2, 'La Liga', 9, 0),
(19, 2, 'Champions League', 1, 0),
(15, 2, 'La Liga', 8, 0),
(15, 2, 'Champions League', 2, 0),
(4, 2, 'La Liga', 7, 4),
(4, 2, 'Champions League', 3, 0),
(16, 2, 'La Liga', 8, 0),
(16, 2, 'Champions League', 2, 0),
(18, 2, 'La Liga', 3, 0),
(18, 2, 'Champions League', 3, 0);

-- Disciplinary Records 2016-17
INSERT INTO Disciplinary_Record (player_id, season_id, red_card, yellow_card) VALUES
(1, 2, 0, 1),
(2, 2, 0, 0),
(4, 2, 1, 10),
(5, 2, 0, 6),
(6, 2, 0, 4),
(7, 2, 0, 6),
(8, 2, 0, 7),
(9, 2, 0, 5),
(10, 2, 0, 3),
(12, 2, 0, 4),
(13, 2, 0, 2),
(14, 2, 0, 6),
(15, 2, 0, 3),
(16, 2, 0, 2),
(17, 2, 0, 2),
(18, 2, 0, 2),
(19, 2, 0, 1),
(20, 2, 0, 7),
(21, 2, 0, 3),
(22, 2, 0, 2),
(24, 2, 0, 2);

-- Clean Sheets 2016-17
INSERT INTO clean_sheet (player_id, season_id, clean_sheet_count) VALUES
(1, 2, 20),
(2, 2, 3);

-- ====================================
-- 12. SEASON 3: 2017-18
-- ====================================
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value) VALUES
(1, 3, 1, 'Squad Player', 20000000),
(2, 3, 13, 'Squad Player', 4000000),
(4, 3, 4, 'Squad Player', 45000000),
(6, 3, 5, 'Squad Player', 40000000),
(7, 3, 12, 'Squad Player', 45000000),
(8, 3, 2, 'Squad Player', 30000000),
(9, 3, 23, 'Squad Player', 20000000),
(10, 3, 6, 'Squad Player', 14000000),
(12, 3, 10, 'Squad Player', 60000000),
(13, 3, 8, 'Squad Player', 70000000),
(14, 3, 14, 'Squad Player', 25000000),
(15, 3, 22, 'Squad Player', 40000000),
(17, 3, 18, 'Squad Player', 30000000),
(18, 3, 17, 'Squad Player', 18000000),
(19, 3, 20, 'Squad Player', 18000000),
(20, 3, 7, 'Squad Player', 110000000),
(21, 3, 9, 'Squad Player', 50000000),
(22, 3, 11, 'Squad Player', 90000000);

-- Player Stats 2017-18
INSERT INTO player_stats_season (player_id, season_id, Matches_played, Assists, minutes_played) VALUES
(1, 3, 35, 0, 3150),
(2, 3, 12, 0, 1080),
(4, 3, 33, 3, 2871),
(6, 3, 33, 2, 2871),
(7, 3, 35, 11, 2975),
(8, 3, 34, 7, 2890),
(9, 3, 21, 3, 1596),
(10, 3, 30, 2, 2160),
(12, 3, 34, 8, 2890),
(13, 3, 33, 10, 2805),
(14, 3, 36, 5, 2844),
(15, 3, 36, 7, 2700),
(17, 3, 34, 4, 2040),
(18, 3, 35, 9, 2275),
(19, 3, 38, 4, 2090),
(20, 3, 37, 8, 3219),
(21, 3, 39, 7, 3159),
(22, 3, 26, 5, 1950);

-- Player Goals 2017-18
INSERT INTO player_goals (player_id, season_id, competition, goals, penalties) VALUES
(20, 3, 'La Liga', 26, 4),
(20, 3, 'Champions League', 15, 1),
(20, 3, 'Copa del Rey', 3, 0),
(21, 3, 'La Liga', 5, 0),
(21, 3, 'Champions League', 3, 0),
(21, 3, 'Copa del Rey', 4, 0),
(22, 3, 'La Liga', 16, 1),
(22, 3, 'Champions League', 5, 0),
(22, 3, 'Copa del Rey', 0, 0),
(19, 3, 'La Liga', 7, 0),
(19, 3, 'Champions League', 1, 0),
(18, 3, 'La Liga', 6, 0),
(18, 3, 'Champions League', 4, 0),
(15, 3, 'La Liga', 7, 0),
(15, 3, 'Champions League', 3, 0),
(4, 3, 'La Liga', 4, 2),
(4, 3, 'Champions League', 3, 0),
(14, 3, 'La Liga', 5, 0),
(14, 3, 'Champions League', 2, 0);

-- Disciplinary Records 2017-18
INSERT INTO Disciplinary_Record (player_id, season_id, red_card, yellow_card) VALUES
(1, 3, 0, 2),
(2, 3, 0, 0),
(4, 3, 1, 9),
(6, 3, 0, 5),
(7, 3, 0, 5),
(8, 3, 0, 6),
(9, 3, 0, 4),
(10, 3, 0, 4),
(12, 3, 0, 5),
(13, 3, 0, 3),
(14, 3, 0, 7),
(15, 3, 0, 4),
(17, 3, 0, 3),
(18, 3, 0, 2),
(19, 3, 0, 2),
(20, 3, 1, 6),
(21, 3, 0, 4),
(22, 3, 0, 3);

-- Clean Sheets 2017-18
INSERT INTO clean_sheet (player_id, season_id, clean_sheet_count) VALUES
(1, 3, 18),
(2, 3, 4);

-- ====================================
-- 13. TRANSFERS DATA (2015-18)
-- ====================================
INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season) VALUES
-- 2015-16 Season
(9, 'Danilo', 'Transfer In', 'Right-Back', 'FC Porto', 'Real Madrid', '€31.5M', '2021', '23', '2015-2016'),
(14, 'Casemiro', 'Transfer In', 'Defensive Midfield', 'FC Porto', 'Real Madrid', '€7.5M', '2021', '14', '2015-2016'),
(18, 'Lucas Vázquez', 'Transfer In', 'Right Winger', 'Espanyol', 'Real Madrid', '€1M', '2021', '18', '2015-2016'),

-- 2016-17 Season
(24, 'Álvaro Morata', 'Transfer In', 'Centre-Forward', 'Juventus', 'Real Madrid', '€30M', '2021', '21', '2016-2017'),

-- 2017-18 Season (Notable departures)
(5, 'Pepe', 'Transfer Out', 'Centre-Back', 'Real Madrid', 'Besiktas', 'Free', '2019', '3', '2017-2018'),
(16, 'James Rodríguez', 'Loan Out', 'Attacking Midfield', 'Real Madrid', 'Bayern Munich', 'Loan', '2019', '10', '2017-2018'),
(24, 'Álvaro Morata', 'Transfer Out', 'Centre-Forward', 'Real Madrid', 'Chelsea', '€66M', '2023', '9', '2017-2018');

-- Season 1: 2015-16 Assists
INSERT INTO player_assists (player_id, season_id, player_name, assists) VALUES
-- Top Assist Providers
(20, 1, 'Cristiano Ronaldo', 11),
(13, 1, 'Toni Kroos', 12),
(12, 1, 'Luka Modrić', 8),
(7, 1, 'Marcelo', 8),
(8, 1, 'Dani Carvajal', 7),
(15, 1, 'Isco', 6),
(16, 1, 'James Rodríguez', 8),
(22, 1, 'Gareth Bale', 5),
(21, 1, 'Karim Benzema', 4),
(17, 1, 'Mateo Kovačić', 4),
(18, 1, 'Lucas Vázquez', 5),
(14, 1, 'Casemiro', 5),
(9, 1, 'Danilo', 3),
(6, 1, 'Raphael Varane', 2),
(4, 1, 'Sergio Ramos', 3),
(10, 1, 'Nacho Fernández', 1),
(23, 1, 'Jesé Rodríguez', 3),
(24, 1, 'Álvaro Morata', 2),
(19, 1, 'Marco Asensio', 1);

-- Season 2: 2016-17 Assists
INSERT INTO player_assists (player_id, season_id, player_name, assists) VALUES
(13, 2, 'Toni Kroos', 13),
(20, 2, 'Cristiano Ronaldo', 12),
(7, 2, 'Marcelo', 10),
(12, 2, 'Luka Modrić', 9),
(19, 2, 'Marco Asensio', 10),
(16, 2, 'James Rodríguez', 9),
(8, 2, 'Dani Carvajal', 8),
(15, 2, 'Isco', 8),
(22, 2, 'Gareth Bale', 7),
(21, 2, 'Karim Benzema', 6),
(14, 2, 'Casemiro', 6),
(18, 2, 'Lucas Vázquez', 10),
(9, 2, 'Danilo', 4),
(17, 2, 'Mateo Kovačić', 5),
(4, 2, 'Sergio Ramos', 4),
(24, 2, 'Álvaro Morata', 3),
(10, 2, 'Nacho Fernández', 2),
(6, 2, 'Raphael Varane', 1);

-- Season 3: 2017-18 Assists
INSERT INTO player_assists (player_id, season_id, player_name, assists) VALUES
(7, 3, 'Marcelo', 11),
(13, 3, 'Toni Kroos', 10),
(19, 3, 'Marco Asensio', 9),
(18, 3, 'Lucas Vázquez', 9),
(12, 3, 'Luka Modrić', 8),
(20, 3, 'Cristiano Ronaldo', 8),
(15, 3, 'Isco', 7),
(21, 3, 'Karim Benzema', 7),
(8, 3, 'Dani Carvajal', 7),
(22, 3, 'Gareth Bale', 5),
(14, 3, 'Casemiro', 5),
(17, 3, 'Mateo Kovačić', 4),
(4, 3, 'Sergio Ramos', 3),
(9, 3, 'Danilo', 3),
(10, 3, 'Nacho Fernández', 2),
(6, 3, 'Raphael Varane', 2);

-- ====================================
-- VERIFICATION QUERIES FOR ASSISTS
-- ====================================
-- SELECT * FROM player_assists WHERE season_id = 1 ORDER BY assists DESC;
-- SELECT * FROM player_assists WHERE season_id = 2 ORDER BY assists DESC;
--SELECT * FROM player_assists WHERE season_id = 3 ORDER BY assists DESC;
-- 
-- -- Top Assist Providers across all three seasons
-- SELECT player_name, SUM(assists) as total_assists
-- FROM player_assists
-- WHERE season_id IN (1, 2, 3)
-- GROUP BY player_name
-- ORDER BY total_assists DESC;

-- ====================================
-- END OF INSERT SCRIPT
-- ====================================








-- ====================================
-- VERIFICATION QUERIES
-- ====================================
 SELECT * FROM season;
 SELECT * FROM coach;
 SELECT * FROM coach_season;
 SELECT * FROM player;
 SELECT * FROM player_season WHERE season_id = 1;
 SELECT * FROM player_stats_season WHERE season_id = 1;
 SELECT * FROM player_goals WHERE season_id = 1;
 SELECT * FROM Disciplinary_Record WHERE season_id = 1;
 SELECT * FROM clean_sheet WHERE season_id = 1;
 SELECT * FROM Transfers;

 ----------------------------SHOTS---------------------------------
  Season 1: 2015-16 Shots
INSERT INTO player_shots (player_id, season_id, player_name, shots) VALUES
-- Forwards & Attacking Players
(20, 1, 'Cristiano Ronaldo', 325),  -- Top shooter
(21, 1, 'Karim Benzema', 165),
(22, 1, 'Gareth Bale', 142),
(23, 1, 'Jesé Rodríguez', 68),
(24, 1, 'Álvaro Morata', 52),

-- Midfielders
(15, 1, 'Isco', 78),
(16, 1, 'James Rodríguez', 95),
(12, 1, 'Luka Modrić', 62),
(13, 1, 'Toni Kroos', 58),
(14, 1, 'Casemiro', 45),
(17, 1, 'Mateo Kovačić', 38),
(18, 1, 'Lucas Vázquez', 52),
(19, 1, 'Marco Asensio', 28),

-- Defenders
(4, 1, 'Sergio Ramos', 65),
(7, 1, 'Marcelo', 48),
(8, 1, 'Dani Carvajal', 42),
(9, 1, 'Danilo', 35),
(6, 1, 'Raphael Varane', 28),
(10, 1, 'Nacho Fernández', 22);

-- Season 2: 2016-17 Shots
INSERT INTO player_shots (player_id, season_id, player_name, shots) VALUES
-- Forwards & Attacking Players
(20, 2, 'Cristiano Ronaldo', 298),
(21, 2, 'Karim Benzema', 148),
(22, 2, 'Gareth Bale', 125),
(24, 2, 'Álvaro Morata', 112),

-- Midfielders
(19, 2, 'Marco Asensio', 95),
(15, 2, 'Isco', 88),
(16, 2, 'James Rodríguez', 82),
(18, 2, 'Lucas Vázquez', 75),
(12, 2, 'Luka Modrić', 58),
(13, 2, 'Toni Kroos', 52),
(14, 2, 'Casemiro', 48),
(17, 2, 'Mateo Kovačić', 42),

-- Defenders
(4, 2, 'Sergio Ramos', 72),
(7, 2, 'Marcelo', 55),
(8, 2, 'Dani Carvajal', 45),
(9, 2, 'Danilo', 38),
(6, 2, 'Raphael Varane', 32),
(10, 2, 'Nacho Fernández', 28);

-- Season 3: 2017-18 Shots
INSERT INTO player_shots (player_id, season_id, player_name, shots) VALUES
-- Forwards & Attacking Players
(20, 3, 'Cristiano Ronaldo', 312),  -- Record shots in 2017-18
(21, 3, 'Karim Benzema', 135),
(22, 3, 'Gareth Bale', 158),

-- Midfielders
(19, 3, 'Lucas Vázquez', 85),
(18, 3, 'Marco Asensio', 92),
(15, 3, 'Isco', 95),
(12, 3, 'Luka Modrić', 65),
(13, 3, 'Toni Kroos', 55),
(14, 3, 'Casemiro', 52),
(17, 3, 'Mateo Kovačić', 45),

-- Defenders
(4, 3, 'Sergio Ramos', 68),
(7, 3, 'Marcelo', 58),
(8, 3, 'Dani Carvajal', 48),
(9, 3, 'Danilo', 32),
(6, 3, 'Raphael Varane', 35),
(10, 3, 'Nacho Fernández', 32);