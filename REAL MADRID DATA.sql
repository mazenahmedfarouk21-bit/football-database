INSERT INTO Transfers (player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
VALUES
('Kiko Casilla', 'Transfer', 'GK', 'Espanyol', 'Real Madrid', '€6M', '2020', '13', '2015/2016'),
('Casemiro', 'End of loan', 'DM', 'Porto', 'Real Madrid', 'Free', '2017', '14', '2015/2016'),
('Mateo Kovacic', 'Transfer', 'CM', 'Inter Milan', 'Real Madrid', '€29M', '2021', '16', '2015/2016'),
('Lucas Vazquez', 'Buy-back', 'RW', 'Espanyol', 'Real Madrid', '€1M', '2020', '18', '2015/2016'),
('Denis Cheryshev', 'End of loan', 'LW', 'Villarreal', 'Real Madrid', 'Free', '2021', '21', '2015/2016'),
('Danilo', 'Transfer', 'RB', 'Porto', 'Real Madrid', '€31.5M', '2021', '23', '2015/2016'),
('Ruben Yanez', 'Promotion', 'GK', 'RM Castilla', 'Real Madrid', 'Free', '2016', '31', '2015/2016'),
('Marco Asensio', 'Transfer', 'AM', 'Mallorca', 'Real Madrid', '€3.5M', '2021', NULL, '2015/2016'),
('Jesus Vallejo', 'Transfer', 'CB', 'Real Zaragoza', 'Real Madrid', '€5M', '2021', NULL, '2015/2016');
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
INSERT INTO Transfers (player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
VALUES
('Iker Casillas', 'Transfer', 'GK', 'Real Madrid', 'Porto', 'Free', NULL, '1', '2015/2016'),
('Fabio Coentrao', 'Loan', 'LB', 'Real Madrid', 'Monaco', 'Loan', '2019', '5', '2015/2016'),
('Sami Khedira', 'End of contract', 'DM', 'Real Madrid', 'Juventus', 'Free', NULL, '6', '2015/2016'),
('Javier Hernandez', 'End of loan', 'CF', 'Real Madrid', 'Manchester United', 'Free', NULL, '14', '2015/2016'),
('Lucas Silva', 'Loan', 'DM', 'Real Madrid', 'Marseille', '€650K', '2020', '16', '2015/2016'),
('Asier Illarramendi', 'Transfer', 'DM', 'Real Madrid', 'Real Sociedad', '€15M', '2021', '24', '2015/2016'),
('Fernando Pacheco', 'Transfer', 'GK', 'Real Madrid', 'Alaves', 'Free', '2018', '25', '2015/2016'),
('Marco Asensio', 'Loan', 'AM', 'Real Madrid', 'Espanyol', 'Loan', '2016', NULL, '2015/2016'),
('Jesus Vallejo', 'Loan', 'CB', 'Real Madrid', 'Real Zaragoza', 'Loan', '2021', NULL, '2015/2016'),
('Denis Cheryshev', 'Loan', 'LW', 'Real Madrid', 'Valencia', 'Loan', '2021', '21', '2015/2016');
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
INSERT INTO season (season_id, season_name, start_year, end_year)
VALUES
(2, '2016/2017', '2016-07-01', '2017-06-30'),
(3, '2017/2018', '2017-07-01', '2018-06-30');
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


USE Real_Madrid;
GO

-- 1) Seasons (IDs ثابتة هنا 1..3)
INSERT INTO season (season_id, season_name, start_year, end_year)
VALUES
 (1, '2014/2015', '2014-07-01', '2015-06-30'),
 (2, '2015/2016', '2015-07-01', '2016-06-30'),
 (3, '2016/2017', '2016-07-01', '2017-06-30');

-- 2) Players (أساسيات: اسم اللاعب و مركز 2-char code)
-- ملاحظة: player_id هو IDENTITY لذا نستخدم INSERT بدون تحديد player_id
INSERT INTO player (player_name, position, birth_date) VALUES
('Toni Kroos','CM', NULL),        -- جاء صيف 2014
('Keylor Navas','GK', NULL),      -- جاء 2014
('Javier Hernández','CF', NULL),  -- إعارى 2014/15
('Álvaro Morata','CF', NULL),     -- بيع/إعادة شراء عبر المواسم
('Denis Cheryshev','LW', NULL),
('Casemiro','DM', NULL),
('Danilo','RB', NULL),
('Kiko Casilla','GK', NULL),
('Lucas Vázquez','RW', NULL),
('Marco Asensio','AM', NULL),
('Mateo Kovačić','CM', NULL),
('Rubén Yáñez','GK', NULL),
('Iker Casillas','GK', NULL),
('Fábio Coentrão','LB', NULL),
('Sami Khedira','DM', NULL),
('Lucas Silva','DM', NULL),
('Asier Illarramendi','DM', NULL),
('Fernando Pacheco','GK', NULL),
('Jesé','RW', NULL),
('Cristiano Ronaldo','CF', NULL),
('Karim Benzema','CF', NULL),
('Gareth Bale','LW', NULL),
('James Rodríguez','AM', NULL),
('Marcelo','LB', NULL),
('Dani Carvajal','RB', NULL),
('Sergio Ramos','CB', NULL);

-- 3) player_season: ادرج اللاعبين في المواسم التي ظهروا بها (قيمة افتراضية للقميص/market_value/transfer_status)
-- مثال: الكثير من اللاعبين كانوا في كل موسم لذا أدخلتهم لكل موسم مناسب.
-- note: تأكد من أن kombinasi player_id و season_id لا تتكرر لأن لديك قيد PK.

-- للحصول على player_id بعد INSERT نستخدم SELECT من جدول player
-- (في قواعد MSSQL يمكن استخدام كلمات ثابتة إذا لم تعرف IDs؛ هنا سأستخدم INSERT ... SELECT pattern)

-- مثال: ضع Toni Kroos في موسم 2014/2015 (قمصان وقيم افتراضية)
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 8, 'signed', 25000000 FROM player WHERE player_name='Toni Kroos';

INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 1, 'signed', 10000000 FROM player WHERE player_name='Keylor Navas';

-- Javier Hernández (إعارة في 2014/2015)
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 14, 'loan', 5000000 FROM player WHERE player_name='Javier Hernández';

-- Denis Cheryshev (كان ضمن تشكيلة 2014/15 ثم أعير لاحقًا)
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 21, 'loan', 1000000 FROM player WHERE player_name='Denis Cheryshev';

-- Casemiro, Danilo, Kiko Casilla, Lucas Vázquez, Marco Asensio, Mateo Kovačić -> يبدؤون 2015/2016
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 2, 14, 'signed', 7500000 FROM player WHERE player_name='Casemiro';

INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 2, 23, 'signed', 31500000 FROM player WHERE player_name='Danilo';

INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 2, 13, 'signed', 6000000 FROM player WHERE player_name='Kiko Casilla';

INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 2, 18, 'buyback', 1000000 FROM player WHERE player_name='Lucas Vázquez';

INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 2, 20, 'signed', 3500000 FROM player WHERE player_name='Marco Asensio';

INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 2, 16, 'signed', 29000000 FROM player WHERE player_name='Mateo Kovačić';

-- بعض اللاعبين الباقيين ندرجهم عبر المواسم (Ronaldo, Benzema, Bale, James, Marcelo, Carvajal, Ramos)
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 7, 'existing', 100000000 FROM player WHERE player_name='Cristiano Ronaldo';
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 9, 'existing', 60000000 FROM player WHERE player_name='Karim Benzema';
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 11, 'existing', 80000000 FROM player WHERE player_name='Gareth Bale';
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 10, 'existing', 70000000 FROM player WHERE player_name='James Rodríguez';
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 12, 'existing', 50000000 FROM player WHERE player_name='Marcelo';
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 2, 'existing', 20000000 FROM player WHERE player_name='Dani Carvajal';
INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
SELECT player_id, 1, 4, 'existing', 35000000 FROM player WHERE player_name='Sergio Ramos';

-- 4) Transfers: أدرجت حركة 2015 (In/Out) كما وردت في صفحة موسم 2015/16 (قيم Fee/Season كموجودة)
INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Transfer', 'GK', 'Espanyol', 'Real Madrid', '€6M', '2020', '13', '2015/2016'
FROM player p WHERE p.player_name='Kiko Casilla';

INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Buy-back', 'DM', 'FC Porto', 'Real Madrid', 'Free', '2021', '14', '2015/2016'
FROM player p WHERE p.player_name='Casemiro';

INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Transfer', 'CM', 'Internazionale', 'Real Madrid', '€29M', '2021', '16', '2015/2016'
FROM player p WHERE p.player_name='Mateo Kovačić';

INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Buy-back', 'RW', 'Espanyol', 'Real Madrid', '€1M', '2020', '18', '2015/2016'
FROM player p WHERE p.player_name='Lucas Vázquez';

INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Transfer', 'RB', 'FC Porto', 'Real Madrid', '€31.5M', '2021', '23', '2015/2016'
FROM player p WHERE p.player_name='Danilo';

-- Outs (2015)
INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Transfer', 'GK', 'Real Madrid', 'FC Porto', 'Free', NULL, '1', '2015/2016'
FROM player p WHERE p.player_name='Iker Casillas';

INSERT INTO Transfers (player_id, player_name, Transfer_Type, Position, From_Club, To_Club, Fee, Contract_End, Shirt_Number, Season)
SELECT p.player_id, p.player_name, 'Loan', 'LB', 'Real Madrid', 'AS Monaco', 'Loan', '2019', '5', '2015/2016'
FROM player p WHERE p.player_name='Fábio Coentrão';

-- 5) player_stats_season, clean_sheet, Disciplinary_Record -> قيم ابتدائية (صفرية) لكل سجل player_season
-- نملأ تلقائياً لجميع صفوف player_season الحالية
INSERT INTO player_stats_season (player_id, season_id, Matches_played,  Assists, minutes_played)
SELECT ps.player_id, ps.season_id, 0, 0, 0
FROM player_season ps
LEFT JOIN player_stats_season pss ON pss.player_id = ps.player_id AND pss.season_id = ps.season_id
WHERE pss.player_id IS NULL;

INSERT INTO clean_sheet (player_id, season_id, clean_sheet_count)
SELECT ps.player_id, ps.season_id, 0
FROM player_season ps
LEFT JOIN clean_sheet cs ON cs.player_id = ps.player_id AND cs.season_id = ps.season_id
WHERE cs.player_id IS NULL;

INSERT INTO Disciplinary_Record (player_id, season_id, red_card, yellow_card)
SELECT ps.player_id, ps.season_id, 0, 0
FROM player_season ps
LEFT JOIN Disciplinary_Record dr ON dr.player_id = ps.player_id AND dr.season_id = ps.season_id
WHERE dr.player_id IS NULL;

GO



--==============================
--   INSERT للاعبين
--==============================
INSERT INTO player (player_name, nationality, position) VALUES
('Cristiano Ronaldo', 'Portugal', 'FW'),
('Karim Benzema', 'France', 'FW'),
('Gareth Bale', 'Wales', 'FW'),
('Luka Modric', 'Croatia', 'MF'),
('Toni Kroos', 'Germany', 'MF'),
('Casemiro', 'Brazil', 'MF'),
('Marcelo', 'Brazil', 'DF'),
('Sergio Ramos', 'Spain', 'DF'),
('Raphael Varane', 'France', 'DF'),
('Keylor Navas', 'Costa Rica', 'GK');

-- الموسم 2015/16
INSERT INTO player_goals (player_id, season_id, competition, goals, penalties) VALUES
(1, 1, 'Liga', 35, 5),
(1, 1, 'UCL', 16, 3),
(1, 1, 'CDR', 5, 1),
(2, 1, 'Liga', 17, 2),
(2, 1, 'UCL', 4, 0),
(3, 1, 'Liga', 21, 3),
(3, 1, 'UCL', 3, 0),
(4, 1, 'Liga', 5, 0),
(5, 1, 'Liga', 6, 0);

-- الموسم 2016/17
INSERT INTO player_goals (player_id, season_id, competition, goals, penalties) VALUES
(1, 2, 'Liga', 25, 4),
(1, 2, 'UCL', 12, 2),
(1, 2, 'CDR', 3, 0),
(2, 2, 'Liga', 19, 1),
(2, 2, 'UCL', 5, 0),
(3, 2, 'Liga', 15, 2),
(3, 2, 'UCL', 4, 0);

-- الموسم 2017/18
INSERT INTO player_goals (player_id, season_id, competition, goals, penalties) VALUES
(1, 3, 'Liga', 26, 5),
(1, 3, 'UCL', 15, 3),
(1, 3, 'CDR', 4, 1),
(2, 3, 'Liga', 18, 2),
(2, 3, 'UCL', 6, 0),
(3, 3, 'Liga', 12, 1),
(3, 3, 'UCL', 5, 1);


--==============================
--   INSERT إحصائيات اللاعبين
--==============================
-- الموسم 2015/16
INSERT INTO player_stats_season (player_id, season_id, matches_played, assists, minutes_played) VALUES
(1, 1, 48, 16, 4200),   -- Cristiano Ronaldo
(2, 1, 42, 9, 3800),    -- Benzema
(3, 1, 38, 7, 3200),    -- Bale
(4, 1, 46, 11, 4000),   -- Modric
(5, 1, 44, 10, 3950),   -- Kroos
(6, 1, 45, 4, 4100),    -- Casemiro
(7, 1, 40, 5, 3500),    -- Marcelo
(8, 1, 44, 3, 4000),    -- Ramos
(9, 1, 38, 1, 3450),    -- Varane
(10, 1, 50, 0, 4500);   -- Navas

-- الموسم 2016/17
INSERT INTO player_stats_season (player_id, season_id, Matches_played, assists, minutes_played) VALUES
(1, 2, 46, 15, 4100),
(2, 2, 40, 8, 3700),
(3, 2, 35, 6, 3100),
(4, 2, 45, 12, 4050),
(5, 2, 43, 9, 3900),
(6, 2, 44, 5, 4000),
(7, 2, 38, 4, 3300),
(8, 2, 42, 3, 3900),
(9, 2, 36, 1, 3400),
(10, 2, 48, 0, 4400);

-- الموسم 2017/18
INSERT INTO player_stats_season (player_id, season_id, Matches_played, assists, minutes_played) VALUES
(1, 3, 44, 14, 4000),
(2, 3, 38, 7, 3600),
(3, 3, 32, 5, 3000),
(4, 3, 42, 10, 3950),
(5, 3, 41, 8, 3850),
(6, 3, 43, 6, 4000),
(7, 3, 36, 3, 3200),
(8, 3, 40, 2, 3800),
(9, 3, 34, 1, 3300),
(10, 3, 46, 0, 4300);
------------------------------------------------------------------------------
-- موسم 2015-2016
INSERT INTO player_assists (player_id, season_id, player_name, assists_count) VALUES
(1, 1, 'Cristiano Ronaldo', 11),   -- حسب المصادر كان عنده حوالي 11 أسيست في الدوري
(2, 1, 'Karim Benzema', 7),
(3, 1, 'Luka Modrić', 5),
(4, 1, 'Gareth Bale', 6),
(5, 1, 'Toni Kroos', 8),
(6, 1, 'James Rodríguez', 10),
(7, 1, 'Isco', 4),
(8, 1, 'Marcelo', 6);

-- موسم 2016-2017
INSERT INTO player_assists (player_id, season_id, player_name, assists_count) VALUES
(1, 2, 'Cristiano Ronaldo', 6),    -- حسب المصادر
(2, 2, 'Karim Benzema', 5),
(3, 2, 'Luka Modrić', 4),
(4, 2, 'Gareth Bale', 5),
(5, 2, 'Toni Kroos', 12),          -- كان الأفضل في الموسم ده
(6, 2, 'James Rodríguez', 5),
(7, 2, 'Isco', 8),
(8, 2, 'Marcelo', 9),
(9, 2, 'Lucas Vázquez', 7),
(10, 2, 'Dani Carvajal', 4),
(11, 2, 'Marco Asensio', 3);

-- موسم 2017-2018  
INSERT INTO player_assists (player_id, season_id, player_name, assists_count) VALUES
(1, 3, 'Cristiano Ronaldo', 5),
(2, 3, 'Karim Benzema', 10),       -- كان الأفضل في الموسم ده حسب StatMuse
(3, 3, 'Luka Modrić', 5),
(4, 3, 'Gareth Bale', 4),
(5, 3, 'Toni Kroos', 8),
(7, 3, 'Isco', 7),
(8, 3, 'Marcelo', 6),              -- حسب المصادر كان عنده 6 أسيست في الليجا
(9, 3, 'Lucas Vázquez', 5),
(11, 3, 'Marco Asensio', 6);