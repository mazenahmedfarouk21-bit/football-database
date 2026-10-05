CREATE DATABASE Real_Madrid ;

CREATE TABLE player ( 
    player_id INT IDENTITY(1,1) PRIMARY KEY,
    player_name VARCHAR(100),
    position VARCHAR(2) NOT NULL,
    birth_date DATE
);
 ALTER TABLE player 
 ADD  nationality VARCHAR (100)
		----------------------------
CREATE TABLE player_assists (
    player_id INT,
    season_id INT,
	player_name VARCHAR (100),
    assists INT DEFAULT 0,

    PRIMARY KEY (player_id, season_id),

    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (season_id) REFERENCES season(season_id)
);
CREATE TABLE player_shots (
    player_id INT,
    season_id INT,
	player_name VARCHAR (100),
    shots INT DEFAULT 0,

    PRIMARY KEY (player_id, season_id),

    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (season_id) REFERENCES season(season_id)
);

		----------------------------	
CREATE TABLE clean_sheet (
                          player_id INT ,
						  season_id INT ,
						  clean_sheet_count INT ,
			  PRIMARY KEY ( player_id , season_id ),
			  FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE 
                          );

CREATE TABLE Disciplinary_Record ( 
                              player_id INT ,
						      season_id INT ,
							  red_card INT NOT NULL, 
							  yellow_card INT NOT NULL,
							  PRIMARY KEY ( player_id , season_id),
							  FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE 
							  );

CREATE TABLE season (
                      season_id INT PRIMARY KEY ,
					  season_name VARCHAR (30),
					  start_year DATE ,
					  end_year  DATE 
					  );


CREATE TABLE player_season ( 
                           player_id INT ,
						   season_id INT , 
						   shirt_number INT NOT NULL ,
						   transfer_status varchar (15),
						   market_value INT NOT NULL ,
						   PRIMARY KEY ( player_id , season_id),
						   FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE ,
						   FOREIGN KEY (season_id) REFERENCES season (season_id) ON DELETE CASCADE
						   );

CREATE TABLE player_stats_season (
                                 player_id INT ,
						         season_id INT ,
                                 Matches_played INT NOT NULL ,
								 Assists INT NOT NULL,
								 minutes_played INT,
			               PRIMARY KEY ( player_id , season_id),
						   FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE ,
						   FOREIGN KEY (season_id) REFERENCES season (season_id) ON DELETE CASCADE
						   )
						   ;


CREATE TABLE player_goals (
                    goal_id INT IDENTITY (1,1) PRIMARY KEY ,
				    player_id INT ,
				    season_id INT,
					competition VARCHAR (20),
					goals INT NOT NULL ,
					penalties INT NOT NULL ,
					FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE CASCADE ,
					FOREIGN KEY (season_id) REFERENCES season (season_id) ON DELETE CASCADE
						   );

CREATE TABLE coach (  
                    coach_id INT IDENTITY (1,1) PRIMARY KEY ,
					first_name VARCHAR(10),
					last_name VARCHAR (10)
					);

CREATE TABLE coach_season ( 
                           coach_id INT NOT NULL,
						   season_id INT NOT NULL ,
						   start_of_season DATE NOT NULL ,
						   end_of_season DATE ,
						   PRIMARY KEY (coach_id,season_id) ,
						   FOREIGN KEY (coach_id) REFERENCES coach (coach_id) ON DELETE CASCADE ,
						   FOREIGN KEY (season_id) REFERENCES season (season_id) ON DELETE CASCADE
						   );

CREATE TABLE Coach_Assistant( 
                            assistant_id INT IDENTITY NOT NULL PRIMARY KEY,
							coach_id INT NOT NULL,
							first_name VARCHAR(10),
					        last_name VARCHAR (10),
							assistant_role VARCHAR (15),
							FOREIGN KEY (coach_id) REFERENCES coach (coach_id) ON DELETE CASCADE 
							);

CREATE TABLE Transfers (
    transfer_id INT IDENTITY(1,1) PRIMARY KEY,
	player_id INT ,
    player_name VARCHAR(100),
    Transfer_Type VARCHAR(50),
    Position VARCHAR(20),
    From_Club VARCHAR(100),
    To_Club VARCHAR(100),
    Fee VARCHAR(20),
    Contract_End VARCHAR(10),
    Shirt_Number VARCHAR(10),
    Season VARCHAR(20)
	FOREIGN KEY (player_id) REFERENCES player (player_id) ON DELETE  CASCADE
);

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_player_season_player ON player_season(player_id);
CREATE INDEX idx_player_season_season ON player_season(season_id);
DROP INDEX 
CREATE INDEX idx_goals_player ON player_goals(player_id);
CREATE INDEX idx_goals_season ON player_goals(season_id);

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
CREATE TRIGGER trg_update_goals
ON player_goals
AFTER INSERT
AS
BEGIN
    UPDATE pss
    SET Goals = pss.Goals + i.goals
    FROM player_state_season pss
    JOIN inserted i
        ON pss.player_id = i.player_id 
       AND pss.season_id = i.season_id;
END;
--------------------------------------------------------------------------------------------------------------
CREATE TRIGGER trg_fix_cards
ON Disciplinary_Record
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE dr
    SET 
        red_card = CASE WHEN dr.red_card < 0 THEN 0 ELSE dr.red_card END,
        yellow_card = CASE WHEN dr.yellow_card < 0 THEN 0 ELSE dr.yellow_card END
    FROM Disciplinary_Record dr
    JOIN inserted i
        ON dr.player_id = i.player_id
       AND dr.season_id = i.season_id;
END;
--------------------------------------------------------------------------------------------------------------
CREATE TRIGGER trg_prevent_duplicate_player_season
ON player_season
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM player_season ps
        JOIN inserted i
           ON ps.player_id = i.player_id
          AND ps.season_id = i.season_id
    )
    BEGIN
        RAISERROR('Player is already registered in this season', 16, 1);
        RETURN;
    END

    INSERT INTO player_season (player_id, season_id, shirt_number, transfer_status, market_value)
    SELECT player_id, season_id, shirt_number, transfer_status, market_value
    FROM inserted;
END;
--------------------------------------------------------------------------------------------------------------
CREATE TRIGGER trg_auto_create_stats
ON player_season
AFTER INSERT
AS
BEGIN
    -- clean sheet
    INSERT INTO clean_sheet (player_id, season_id, clean_sheet_count)
    SELECT player_id, season_id, 0
    FROM inserted;

    -- disciplinary record
    INSERT INTO Disciplinary_Record (player_id, season_id, red_card, yellow_card)
    SELECT player_id, season_id, 0, 0
    FROM inserted;

    -- player state season (goals, assists, matches)
    INSERT INTO player_state_season (player_id, season_id, Matches_played, Goals, Assists)
    SELECT player_id, season_id, 0, 0, 0, 0, 0
    FROM inserted;
END;
--------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------

