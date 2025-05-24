-- Active: 1747409020969@@127.0.0.1@5432@conservation_db
-- Create Database  Wildlife Conservation Monitoring
CREATE DATABASE conservation_db;

-- Create rangers table
CREATE TABLE rangers (
ranger_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
region VARCHAR(100) NOT NULL,
phone VARCHAR(20) NOT NULL,
);



-- Create Species table
CREATE TABLE species (
species_id SERIAL PRIMARY KEY,
common_name VARCHAR(100),
scientific_name VARCHAR(150),
discovery_date DATE,
conservation_status VARCHAR(100)

);