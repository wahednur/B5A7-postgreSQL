-- Active: 1747409020969@@127.0.0.1@5432@conservation_db
-- Create Database  Wildlife Conservation Monitoring

--Step 1: Create Database
CREATE DATABASE conservation_db;


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
('Asian Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Hoolock Gibbon', 'Hoolock hoolock', '1861-01-01', 'Endangered'),
('Fishing Cat', 'Prionailurus viverrinus', '1821-01-01', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica gangetica', '1828-01-01', 'Endangered'),
('Clouded Leopard', 'Neofelis nebulosa', '1821-01-01', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Near Threatened'),
('Leopard Cat', 'Prionailurus bengalensis', '1792-01-01', 'Least Concern'),
('Indian Python', 'Python molurus', '1758-01-01', 'Near Threatened'),
('Red Junglefowl', 'Gallus gallus', '1758-01-01', 'Least Concern');

-- Check species information
SELECT * FROM species;

-- Insert sightings  information
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Snowfall Pass', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Sundarban East', '2024-05-11 14:25:00', 'Fresh paw prints found'),
(3, 3, 'Madhupur Range Pass', '2024-05-12 09:10:00', 'Group of 3 seen crossing path'),
(4, 4, 'Bandarban Hill Track', '2024-05-13 15:40:00', 'Heard trumpeting from far'),
(5, 1, 'Tiger Pass', '2024-05-14 06:30:00', 'Sighting confirmed with binoculars'),
(6, 2, 'Lawachara Forest', '2024-05-15 17:55:00', 'Juvenile animal observed'),
(7, 3, 'Kaptai Pass Trail', '2024-05-16 11:20:00', 'Animal resting under bush'),
(8, 1, 'Chittagong Hill Pass', '2024-05-17 13:35:00', 'Claw marks on tree trunk'),
(9, 2, 'Rema-Kalenga Reserve', '2024-05-18 16:45:00', NULL),
(10, 3, 'Nilgiri View Pass', '2024-05-19 07:05:00', 'Seen at sunrise near hill edge');

-- Check sightings information
SELECT * FROM sightings;

-- Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region, phone)
VALUES ('Derek Fox', 'Coastal Plains', '01917839303');


-- Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) as unique_species_count FROM sightings