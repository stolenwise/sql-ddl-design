-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;
\c outer_space


CREATE TABLE galaxies (
    galaxy_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);


CREATE TABLE orbital_bodies (
    orbital_body_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxies(galaxy_id)
);


CREATE TABLE planets (
    planet_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around_id INT REFERENCES orbital_bodies(orbital_body_id)
);


CREATE TABLE moons (
    moon_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    planet_id INT REFERENCES planets(planet_id) ON DELETE CASCADE
);

INSERT INTO galaxies (name) 
VALUES 
('Milky Way'),
('Andromeda');  

INSERT INTO orbital_bodies (name, galaxy_id) 
VALUES 
('The Sun', 1),
('Proxima Centauri', 1),
('Gliese 876', 1);

INSERT INTO planets (name, orbital_period_in_years, orbits_around_id) 
VALUES 
('Earth', 1.00, 1),
('Mars', 1.88, 1),
('Venus', 0.62, 1),
('Neptune', 164.8, 1),
('Proxima Centauri b', 0.03, 2),
('Gliese 876 b', 0.23, 3);

INSERT INTO moons (name, planet_id) 
VALUES 
('The Moon', 1),
('Phobos', 2),
('Deimos', 2),
('Naiad', 4),
('Thalassa', 4),
