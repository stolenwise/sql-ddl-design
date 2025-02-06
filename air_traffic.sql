-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  ticket_id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passengers(passenger_id),
  flight_id INT REFERENCES flights(flight_id),
  travel_id INT REFERENCES travels(travel_id),
);

CREATE TABLE passengers (
  passenger_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
)

CREATE TABLE flights (
  flight_id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL, 
  airline TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  
)

CREATE TABLE travels (
  travel_id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
)

INSERT INTO passengers
  (first_name, last_name)
  VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO flights
  (seat, departure, arrival, airline)
  VALUES
  ( '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United'),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways'),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta'),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta'),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium'),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China'),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United'),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines'),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines'),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil');

INSERT INTO travels
  (from_city, from_country, to_city, to_country)
  VALUES
  ('Washington DC', 'United States', 'Seattle', 'United States'),
  ('Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Paris', 'France', 'Casablanca', 'Morocco'),
  ('Dubai', 'UAE', 'Beijing', 'China'),
  ('New York', 'United States', 'Charlotte', 'United States'),
  ('Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO tickets (passenger_id, flight_id, travel_id) 
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(1, 4, 4),
(4, 5, 5),
(2, 6, 6),
(5, 7, 7),
(6, 8, 8),
(5, 9, 9),
(7, 10, 10);