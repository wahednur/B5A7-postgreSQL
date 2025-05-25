-- Active: 1747409020969@@127.0.0.1@5432@conservation_db
-- Create Database  Wildlife Conservation Monitoring

--Step 1: Create Database
CREATE DATABASE conservation_db;
DROP DATABASE conservation_db;



-- Create rangers table
CREATE TABLE rangers (
ranger_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
region VARCHAR(100) NOT NULL, 
phone VARCHAR(20) NOT NULL
);



-- Create Species table
CREATE TABLE species (
species_id SERIAL PRIMARY KEY,
common_name VARCHAR(100),
scientific_name VARCHAR(150),
discovery_date DATE,
conservation_status VARCHAR(100)
);


-- Create Sightings table
CREATE TABLE sightings(
sighting_id SERIAL PRIMARY KEY,
species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
location VARCHAR(150),
sighting_time TIMESTAMP,
notes TEXT
);


-- STEP 3: Insert Sample Data into rangers
-- Insert rangers information
INSERT INTO rangers (name, region, phone) VALUES
('Meera Akhter', 'Sundarbans West', '01711-123456'),
('Shahadat Hossain', 'Sundarbans East', '01812-223344'),
('Nasima Begum', 'Chittagong Hill Tracts', '01913-334455'),
('Rezaul Karim', 'Sylhet Forest Zone', '01614-445566'),
('Jannatul Ferdous', 'Cox''s Bazar Coastal Belt', '01715-556677'),
('Abdul Halim', 'Lawachara National Park', '01816-667788'),
('Farzana Yasmin', 'Modhupur Forest', '01517-778899'),
('Anwar Sadat', 'Rangamati Hills', '01318-889900'),
('Lamia Chowdhury', 'Garo Hills Zone', '01719-990011'),
('Rakibul Islam', 'Barisal Forest Belt', '01920-101112');

-- Check rangers information

SELECT * FROM rangers;

-- Insert species information
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Asian Elephant', 'Elephas maximus', '1758-01-01', 'Endangered'),
('Hoolock Gibbon', 'Hoolock hoolock', '1867-01-01', 'Vulnerable'),
('Fishing Cat', 'Prionailurus viverrinus', '1820-01-01', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
('Clouded Leopard', 'Neofelis nebulosa', '1821-01-01', 'Vulnerable'),
('Pangolin', 'Manis crassicaudata', '1822-01-01', 'Critically Endangered'),
('Leopard Cat', 'Prionailurus bengalensis', '1792-01-01', 'Least Concern'),
('Indian Python', 'Python molurus', '1758-01-01', 'Near Threatened'),
('Saltwater Crocodile', 'Crocodylus porosus', '1801-01-01', 'Vulnerable'),
('Jungle Cat', 'Felis chaus', '1776-01-01', 'Least Concern'),
('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
('Red Junglefowl', 'Gallus gallus', '1758-01-01', 'Least Concern');





-- Check species information
SELECT * FROM species;

-- Insert sightings  information
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Sundarban Pass', '2024-05-10 07:45:00', 'Seen near the river'),
(2, 2, 'Hilltop Zone', '2024-05-12 16:20:00', 'Pair observed'),
(3, 3, 'Forest Edge', '2024-05-15 09:10:00', 'Tracks found'),
(5, 1, 'Gibbon Valley', '2024-05-18 18:30:00', 'Group vocalizing'),
(7, 2, 'Coastal Pass', '2024-05-20 11:00:00', 'Juvenile spotted');




-- Check sightings information
SELECT * FROM sightings;

-- 1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region, phone)
VALUES ('Derek Fox', 'Coastal Plains', '01917839303');


-- 2. Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) as unique_species_count FROM sightings

-- 3. Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location ILIKE '%Pass%';


-- 4.  List each ranger's name and their total number of sightings.
SELECT r.name AS ranger_name,
COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY total_sightings DESC;


-- 5. List species that have never been sighted.
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings si ON sp.species_id = si.species_id
WHERE si.sighting_id IS NULL;

-- 6️ Show the most recent 2 sightings.

SELECT sp.common_name, si.sighting_time, r.name
FROM sightings si
JOIN species sp ON si.species_id = sp.species_id
JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;


-- 7. Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';


-- 8️ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings
ORDER BY sighting_id;


-- 9️. Delete rangers who have never sighted any species

DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
  WHERE ranger_id IS NOT NULL
);
