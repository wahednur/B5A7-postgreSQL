-- Active: 1747409020969@@127.0.0.1@5432@conservation_db
-- Create Database  Wildlife Conservation Monitoring
CREATE DATABASE conservation_db;

-- Create rangers table
CREATE TABLE rangers (
ranger_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
location TEXT,
phone VARCHAR(20)
)