-- Active: 1747409020969@@127.0.0.1@5432@conservation_db
-- Create Database  Wildlife Conservation Monitoring
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
