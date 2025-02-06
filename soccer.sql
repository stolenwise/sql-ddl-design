-- Design a schema for a simple sports league. Your schema should keep track of

-- - All of the teams in the league
-- - All of the goals scored by every player for each game
-- - All of the players in the league and their corresponding teams
-- - All of the referees who have been part of each game
-- - All of the matches played between teams
-- - All of the start and end dates for season that a league has
-- - The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

-- from the terminal run:
-- psql < craigslist.sql

-- Schema
-- Teams table
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL UNIQUE,
    home_city TEXT
);

-- Players table
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INT REFERENCES teams(team_id)
);

-- Referees table
CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

-- Seasons table
CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    season_year INT NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Matches table
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams(team_id),
    away_team_id INT REFERENCES teams(team_id),
    match_date DATE NOT NULL,
    referee_id INT REFERENCES referees(referee_id),
    season_id INT REFERENCES seasons(season_id)
);

-- Goals table
CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(player_id),
    match_id INT REFERENCES matches(match_id),
    goal_time TIME NOT NULL
);

INSERT INTO teams (team_name, home_city) VALUES
('Red Hawks', 'New York'),
('Blue Sharks', 'Los Angeles'),
('Golden Lions', 'Chicago'),
('Silver Wolves', 'San Francisco'),
('Black Panthers', 'Seattle');

INSERT INTO players (first_name, last_name, team_id) VALUES
('John', 'Smith', 1),
('David', 'Brown', 1),
('Alex', 'Johnson', 2),
('Maria', 'Garcia', 2),
('Emily', 'Davis', 3),
('Michael', 'Lee', 3),
('Sarah', 'Miller', 4),
('Chris', 'Taylor', 5);

INSERT INTO referees (first_name, last_name) VALUES
('William', 'Wilson'),
('James', 'Clark'),
('Olivia', 'Lewis');

INSERT INTO seasons (season_year, start_date, end_date) VALUES
(2023, '01-01-2023', '12-31-2023'),
(2024, '01-01-2023', '12-31-2024');

INSERT INTO matches (home_team_id, away_team_id, match_date, referee_id, season_id) VALUES
(1, 2, '03-15-2023', 1, 1),
(3, 4, '04-10-2023', 2, 1),
(5, 1, '05-20-2023', 3, 1),
(2, 3, '02-05-2024', 1, 2),
(4, 5, '03-25-2024', 2, 2);

INSERT INTO goals (player_id, match_id, goal_time) VALUES
(1, 1, '00:15:00'),  -- John Smith scored in match 1 at the 15th minute
(2, 1, '00:45:00'),  -- David Brown scored in match 1 at the 45th minute
(3, 2, '00:30:00'),  -- Alex Johnson scored in match 2 at the 30th minute
(6, 2, '00:50:00'),  -- Michael Lee scored in match 2 at the 50th minute
(7, 3, '00:20:00'),  -- Sarah Miller scored in match 3 at the 20th minute
(4, 4, '00:10:00'),  -- Maria Garcia scored in match 4 at the 10th minute
(8, 5, '00:40:00');  -- Chris Taylor scored in match 5 at the 40th minute
