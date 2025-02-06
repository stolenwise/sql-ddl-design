-- Design the schema for a medical center.

-- - A medical center employs several doctors
-- - A doctors can see many patients
-- - A patient can be seen by many doctors
-- - During a visit, a patient may be diagnosed to have one or more diseases.

-- from the terminal run:
-- psql < medical_center.sql

-- Schema
--Doctors table
CREATE TABLE doctors (
doctor_id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
speciality TEXT);

--Patients table
CREATE TABLE patients (
patient_id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
birth_date DATE,
insurance TEXT NOT NULL);

--Visits table
CREATE TABLE visits (
visit_id SERIAL PRIMARY KEY,
doctor_id INT REFERENCES doctors(doctor_id),
patient_id INT REFERENCES patients(patient_id),
visit_date DATE NOT NULL);

--Disease table
CREATE TABLE diseases (
disease_id SERIAL PRIMARY KEY,
disease_name TEXT NOT NULL UNIQUE);

--Diagnosis table
CREATE TABLE diagnosis (
diagnosis_id SERIAL PRIMARY KEY,
visit_id INT REFERENCES visits(visit_id),
disease_id INT REFERENCES diseases(disease_id),
diagnosis_info TEXT);

-- Sample Data

-- Insert doctors
INSERT INTO doctors (first_name, last_name, specialty) VALUES 
('Ryan', 'Johnson', 'Cardiology'),
('Megan', 'Hart', 'Pediatrist');

-- Insert patients
INSERT INTO patients (first_name, last_name, birth_date) VALUES 
('Michael', 'Salinger', '05-12-1981'),
('Josie', 'Luck', '07-22-1993');

-- Insert a visit
INSERT INTO visits (doctor_id, patient_id, visit_date) VALUES 
(1, 1, '02-06-2024'),
(2, 2, '03-03-2024');

-- Insert diseases
INSERT INTO diseases (disease_name) VALUES 
('Hypertension'),
('Heart attack'),
('Stroke'),
('Foot Fungus');


-- Insert diagnoses
INSERT INTO diagnoses (visit_id, disease_id, diagnosis_details) VALUES 
(1, 1, 'Diagnosed with Stage 1 Hypertension'),
(2, 2, 'Foot Fungus, detected');

