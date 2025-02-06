
-- Design a schema for Craigslist! Your schema should keep track of the following

-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to

-- from the terminal run:
-- psql < craigslist.sql

-- Schema
--Regions Table
CREATE TABLE region (
region_id SERIAL PRIMARY KEY,
state_name TEXT NOT NULL,
town_name TEXT NOT NULL);

--Users Table
CREATE TABLE users (
user_id SERIAL PRIMARY KEY, 
username TEXT NOT NULL,
email TEXT NOT NULL,
current_region_id INT REFERENCES region(region_id)
);

--Categories Table
CREATE TABLE categories (
category_id SERIAL PRIMARY KEY,
category_name TEXT NOT NULL UNIQUE);

--Posts Table
CREATE TABLE posts (
post_id SERIAL PRIMARY KEY,
title TEXT NOT NULL,
description TEXT NOT NULL,
user_id INT REFERENCES users(user_id),
region_id INT REFERENCES region(region_id),
post_data DATE);
CREATE TABLE

--Post-Categories Table
-- When posts are deleted, delete the corresponding rows in post_categories 
CREATE TABLE post_categories (
post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
category_id INT REFERENCES categories(category_id) ON DELETE CASCADE,
PRIMARY KEY (post_id, category_id));


INSERT INTO regions (region_name) VALUES
('San Francisco'),
('Seattle'),
('New York City'),
('Los Angeles'),
('Chicago');

INSERT INTO categories (category_name) VALUES
('Jobs'),
('Housing'),
('Services'),
('Community'),
('For Sale');

INSERT INTO users (username, email, preferred_region_id) VALUES
('john_doe', 'john@example.com', 1),
('jane_smith', 'jane@example.com', 2),
('alex_miller', 'alex@example.com', 3),
('maria_garcia', 'maria@example.com', 4),
('david_lee', 'david@example.com', 1);

INSERT INTO posts (title, description, user_id, region_id) VALUES
('Software Engineer Needed', 'Looking for an experienced software engineer to join our team.', 1, 1),
('Apartment for Rent in Seattle', 'Spacious 2-bedroom apartment available in downtown Seattle.', 2, 2),
('Freelance Graphic Designer', 'Hire a creative designer for logos and branding.', 3, 3),
('Community Gardening Meetup', 'Join us for a weekend community gardening event.', 4, 1),
('Used Car for Sale', 'Selling my 2018 Toyota Corolla in excellent condition.', 5, 5);

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1),  -- 'Software Engineer Needed' in 'Jobs'
(2, 2),  -- 'Apartment for Rent in Seattle' in 'Housing'
(3, 3),  -- 'Freelance Graphic Designer' in 'Services'
(4, 4),  -- 'Community Gardening Meetup' in 'Community'
(5, 5);  -- 'Used Car for Sale' in 'For Sale'
