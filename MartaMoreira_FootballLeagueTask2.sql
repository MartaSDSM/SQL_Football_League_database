-------DATA DEFINITION LANGUAGE--------
-------CREATING TABLES
CREATE TABLE team (
    Team_Id int PRIMARY KEY,
    Team_Name varchar(50)
);

CREATE TABLE participatingGroup (
    ParticipatingGroup_Id int PRIMARY KEY,
    Cohort_Name varchar(50)
);

CREATE TABLE player(
    Consultant_ID int PRIMARY KEY,
    Last_Name varchar(50),
    First_Name varchar(50),
    Team_ID int,
    Group_ID int,
    FOREIGN KEY (Team_ID) REFERENCES team (Team_ID),
    FOREIGN KEY (Group_ID) REFERENCES participatingGroup (participatingGroup_ID)
);


CREATE TABLE venues (
    Venues_Id int PRIMARY KEY,
    Venues_Name varchar(50)
);


-- While doing the exercises the booking information in the matches attributes
-- instead of the other way around as it was difficult to acess through the match_name 
-- because its not unique and using the match_Id would insert 2 rows of information 
-- for the same match

CREATE TABLE bookings (
    Booking_Id int PRIMARY KEY,
    Venue_ID int,
    Date date,
    Time time,
    FOREIGN KEY (Venue_ID) REFERENCES venues (Venues_Id)
);



CREATE TABLE matches (
    Match_Id int PRIMARY KEY,
	Match_Number int,
    Team_ID int,
    isHomeTeam boolean,
	Booking_ID int,
    FOREIGN KEY (Team_ID) REFERENCES team (Team_Id),
	FOREIGN KEY (Booking_ID) REFERENCES bookings (Booking_ID)
);


CREATE TABLE goals (
    Goal_Id int PRIMARY KEY,
    Player_Id int,
    Match_ID int,
    Time time,
    FOREIGN KEY (Match_ID) REFERENCES matches (Match_ID)
);


CREATE TABLE fouls (
    Foul_Id int PRIMARY KEY,
    Player_Id int,
    Foul_Type varchar(50),
    Match_ID int,
    Time time,
    FOREIGN KEY (Player_Id) REFERENCES player (Consultant_Id),
    FOREIGN KEY (Match_ID) REFERENCES matches (Match_ID)
);


CREATE TABLE transfers (
    Transfer_Id serial PRIMARY KEY,
    Player_Id int,
    New_Team_Id int,
    Date date,
    FOREIGN KEY (Player_Id) REFERENCES player (Consultant_Id),
    FOREIGN KEY (New_Team_Id) REFERENCES team (Team_Id)
);

--------------------------------------------------------------------------------

-- DROP TABLE table_name;

-------DATA MANIPULATION LANGUAGE--------

-- INSERT INTO table_name (column1, column2, ...)
-- VALUES (value1, value2, ...);


INSERT INTO team (Team_Id, Team_Name) VALUES
(1, 'Data Masters'),
(2, 'Vis Wizards'),
(3, 'BI Gods'),
(4, 'Data Cleaners');


INSERT INTO participatingGroup (ParticipatingGroup_Id, Cohort_Name) VALUES
(1, 'Cohort 4'),
(2, 'Cohort 5'),
(3, 'Cohort 6'),
(4, 'Cohort 7'),
(5, 'Bench'),
(6, 'Training Team'),
(7, 'HR'),
(8, 'Consultants');



INSERT INTO player (Consultant_ID, Last_Name, First_Name, Team_ID, Group_ID) VALUES
(200, 'Petty', 'Aedan', 1, 1),
(201, 'Santos', 'Aliza', 1, 3),
(202, 'Vaughan', 'Kaylynn', 1, 6),
(203, 'Bauer', 'Arjun', 1, 4),
(204, 'Huber', 'Lilian', 1, 2),
(205, 'Roberts', 'Lizeth', 1, 6),
(206, 'Mcdowell', 'Nathan', 1, 7),
(207, 'Ali', 'Alvin', 1, 8),
(208, 'Christensen', 'Jordin', 1, 7),
(209, 'Blevins', 'Saul', 1, 7),
(210, 'Meza', 'Carina', 3, 2),
(211, 'Campos', 'Isabelle', 3, 5),
(212, 'Phelps', 'Kyleigh', 3, 1),
(213, 'Wong', 'Angela', 3, 7),
(214, 'Rojas', 'Kole', 3, 7),
(215, 'Potts', 'Martha', 3, 4),
(216, 'Powell', 'Tomas', 3, 6),
(217, 'Clarke', 'Paxton', 3, 5),
(218, 'Dodson', 'Jamya', 3, 8),
(219, 'Clements', 'Georgia', 3, 8),
(220, 'Crawford', 'Edwin', 2, 2),
(221, 'Osborn', 'Malachi', 2, 8),
(222, 'Kent', 'Zion', 2, 2),
(223, 'Reyes', 'Anahi', 2, 5),
(224, 'Cabrera', 'Maddox', 2, 8),
(225, 'Gutierrez', 'Brody', 2, 4),
(226, 'Stevenson', 'Hayley', 2, 3),
(227, 'Sanchez', 'Kamora', 2, 8),
(228, 'Holmes', 'Livia', 2, 6),
(229, 'Jenkins', 'Tanner', 2, 8),
(230, 'Meadows', 'Madelyn', 4, 5),
(231, 'Wilkerson', 'Paola', 4, 3),
(232, 'Patton', 'Jared', 4, 6),
(233, 'Washington', 'Pierre', 4, 8),
(234, 'Cochran', 'Dominik', 4, 4),
(235, 'Skinner', 'Miya', 4, 4),
(236, 'Barnett', 'Mara', 4, 5),
(237, 'Dodson', 'Cornelius', 4, 2),
(238, 'Kaiser', 'Ashleigh', 4, 6),
(239, 'Meza', 'Weston', 4, 6);



INSERT INTO venues (Venues_Id, Venues_Name) VALUES
(1, 'Wimbledon 1'),
(2, 'Wimbledon 2'),
(3, 'Wimbledon 3');


-----------------------------------------------------
INSERT INTO bookings (Booking_Id, Venue_ID, Date, Time)
VALUES
    (1, 1, '2022-10-01', '16:00'),
    (2, 2, '2022-10-01', '16:00'),
    (3, 2, '2022-10-08', '16:00'),
    (4, 3, '2022-10-08', '16:00'),
    (5, 3, '2022-10-22', '16:00'),
    (6, 2, '2022-10-22', '16:00'),
    (7, 1, '2022-10-29', '16:00'),
    (8, 3, '2022-10-29', '16:00'),
    (9, 3, '2022-11-05', '16:00'),
    (10, 1, '2022-11-05', '16:00'),
    (11, 2, '2022-11-12', '16:00'),
    (12, 3, '2022-11-12', '16:00');
	
-- In this case the booking_id and match_ID are the same, but its important to consider that the same match
-- can have multiple venues booked (for example if the same match was postponed)



INSERT INTO matches (Match_Id, Match_Number, Team_ID, isHomeTeam, Booking_ID) VALUES
(1, 1, 1, true, 1),   -- Data Masters (Home Team), Match 1
(2, 1, 3, false, 1),  -- BI Gods (Away Team), Match 1
(3, 2, 2, true, 2),   -- Vis Wizards (Home Team), Match 2
(4, 2, 4, false, 2),  -- Data Cleaners (Away Team), Match 2
(5, 3, 1, true, 3),   -- Data Masters (Home Team), Match 3
(6, 3, 2, false, 3),  -- Vis Wizards (Away Team), Match 3
(7, 4, 3, true, 4),   -- BI Gods (Home Team), Match 4
(8, 4, 4, false, 4),  -- Data Cleaners (Away Team), Match 4
(9, 5, 1, true, 5),   -- Data Masters (Home Team), Match 5
(10, 5, 4, false, 5),  -- Data Cleaners (Away Team), Match 5
(11, 6, 3, true, 6),   -- BI Gods (Home Team), Match 6
(12, 6, 2, false, 6),  -- Vis Wizards (Away Team), Match 6
(13, 7, 3, true, 7),   -- BI Gods (Home Team), Match 7
(14, 7, 1, false, 7),  -- Data Masters (Away Team), Match 7
(15, 8, 4, true, 8),   -- Data Cleaners (Home Team), Match 8
(16, 8, 2, false, 8),  -- Vis Wizards (Away Team), Match 8
(17, 9, 2, true, 9),   -- Vis Wizards (Home Team), Match 9
(18, 9, 1, false, 9),  -- Data Masters (Away Team), Match 9
(19, 10, 4, true, 10), -- Data Cleaners (Home Team), Match 10
(20, 10, 3, false, 10),-- BI Gods (Away Team), Match 10
(21, 11, 4, true, 11), -- Data Cleaners (Home Team), Match 11
(22, 11, 1, false, 11),-- Data Masters (Away Team), Match 11
(23, 12, 2, true, 12), -- Vis Wizards (Home Team), Match 12
(24, 12, 3, false, 12);-- BI Gods (Away Team), Match 12



INSERT INTO goals (Goal_Id, Player_Id, Match_ID, Time) VALUES
(1, 207, 1, NULL),   -- Data Masters
(2, 206, 1, NULL),   -- Data Masters
(3, 234, 2, NULL),   -- Data Cleaner
(4, 226, 2, NULL),   -- Vis Wizards
(5, 207, 3, NULL),   -- Data Masters
(6, 226, 3, NULL),   -- Vis Wizards
(7, 218, 4, NULL),   -- BI Gods
(8, 216, 4, NULL),   -- BI Gods
(9, 234, 4, NULL),   -- Data Cleaner
(10, 218, 6, NULL),   -- BI Gods
(11, 227, 6, NULL),   -- Vis Wizards
(12, 226, 6, NULL),   -- Vis Wizards
(13, 215, 7, NULL),   -- BI Gods
(14, 218, 7, NULL),   -- BI Gods
(15, 207, 7, NULL),   -- Data Masters
(16, 202, 7, NULL),   -- Data Masters
(17, 234, 8, NULL),   -- Data Cleaner
(18, 224, 8, NULL),   -- Vis Wizards
(19, 228, 9, NULL),   -- Vis Wizards
(20, 225, 9, NULL),   -- Vis Wizards
(21, 206, 9, NULL),   -- Data Masters
(22, 207, 9, NULL),   -- Data Masters
(23, 218, 10, NULL),   -- BI Gods
(24, 234, 11, NULL),   -- Data Cleaner
(25, 236, 11, NULL),   -- Data Cleaner
(26, 225, 12, NULL),   -- Vis Wizards
(27, 224, 12, NULL),   -- Vis Wizards
(28, 218, 12, NULL),   -- BI Gods
(29, 217, 12, NULL);   -- BI Gods
-- SELECT *
-- FROM goals


INSERT INTO fouls (Foul_Id, Player_Id, Foul_Type, Match_ID, Time) VALUES
(1, 211, 'Yellow card', 1, NULL),
(2, 229, 'Yellow card', 2, NULL),
(3, 200, 'Yellow card', 3, NULL),
(4, 208, 'Yellow card', 3, NULL),
(5, 231, 'Red card', 4, NULL),
(6, 209, 'Yellow card', 5, NULL),
(7, 237, 'Yellow card', 5, NULL),
(8, 202, 'Yellow card', 7, NULL),
(9, 234, 'Yellow card', 8, NULL),
(10, 222, 'Yellow card', 9, NULL),
(11, 231, 'Red card', 10, NULL),
(12, 200, 'Yellow card', 11, NULL),
(13, 216, 'Yellow card', 12, NULL);


---------------------	DATA VALIDATION  ----------------------
SELECT *
FROM team;

SELECT *
FROM participatingGroup;

SELECT *
FROM player;

SELECT *
FROM venues;

SELECT *
FROM bookings;

SELECT *
FROM matches;

SELECT *
FROM goals;

SELECT *
FROM fouls;

-- QUESTIONS
-- Listing all students who play for a particular department (Cohort 4 group)
SELECT players
FROM public."StudentsCohort4";
/* SELECT concat(player.first_name, ' ', player.last_name) AS players
   FROM player
     JOIN participatinggroup ON player.group_id = participatinggroup.participatinggroup_id
  WHERE participatinggroup.cohort_name::text = 'Cohort 4'::text;
  */
-------------------------------------------------------------------------------------------------------------------
-- Listing all fixtures for a specific date (29th of October 2022) including team names and venues
-- STEP 1. Select home team and away team from the same match number
-- self join
SELECT
    m.Match_Number,
    home_team.Team_Name AS Home_Team,
    away_team.Team_Name AS Away_Team
FROM matches m

JOIN team home_team ON m.Team_ID = home_team.Team_Id AND m.isHomeTeam = true 					-- Go to matches and select home team for that matchNumber
											
JOIN matches m_away ON m.Match_Number = m_away.Match_Number AND m.Match_ID <> m_away.Match_ID 	-- In the sames matches list, 
																								-- get the rows with the same match_Number but different match id (which is unique)

JOIN team away_team ON m_away.Team_ID = away_team.Team_Id; 										-- The same match number but different ID will be the away team (isHomeTeam = false)


-- STEP 2: Go to the bookings for 29th od October and get the venues used
SELECT
    m.Match_Number,
    home_team.Team_Name AS Home_Team,
    away_team.Team_Name AS Away_Team,
    v.Venues_Name
FROM matches m
INNER JOIN team home_team ON m.Team_ID = home_team.Team_Id AND m.isHomeTeam = true
INNER JOIN matches m_away ON m.Match_Number = m_away.Match_Number AND m.Match_Id <> m_away.Match_Id
INNER JOIN team away_team ON m_away.Team_ID = away_team.Team_Id AND m_away.isHomeTeam = false
INNER JOIN bookings b ON m.Booking_ID = b.Booking_Id
INNER JOIN venues v ON b.Venue_ID = v.Venues_Id
WHERE b.Date = '2022-10-29';
-------------------------------------------------------------------------------------------------------------------
-- Listing all the players who have scored more than 2 goals.
SELECT
    CONCAT(player.First_Name, ' ', player.Last_Name) AS Players,
    COUNT(goals.Goal_Id) AS Goals_Scored
FROM goals
INNER JOIN player ON goals.Player_Id = player.Consultant_ID
GROUP BY player.Consultant_ID
HAVING COUNT(goals.Goal_Id) > 2; 

/*
-- Return the number of goals in favour, goals against, goals difference and points by team
-- Step by Step
-- 1. get goals in favour of a team
SELECT
    t.Team_Name,
    COUNT(*) AS Goals_In_Favor
FROM goals g
JOIN matches m ON g.Match_ID = m.Match_Id
JOIN team t ON m.Team_ID = t.Team_Id
GROUP BY t.Team_Name;
--go through goals get match id (you can already tell which team is for by match Is)
-- sum all the goals scored by each team
--2. get goals against
-- do it for 1 match
SELECT
    m.Match_Number,
    home_team.Team_Name AS Home_Team,
    away_team.Team_Name AS Away_Team,
	home_Goals,
	away_Goals
	
	
--COUNT(*) AS Goals_Against


 */

