-- Create disease table
CREATE TABLE disease (
    id VARCHAR(3) PRIMARY KEY, 
    name TEXT,
    type TEXT
);

-- Create patient table
CREATE TABLE patient (
    id TEXT PRIMARY KEY,
    age INTEGER,
    sex TEXT
);

-- Create patient_disease table to establish many-to-many relationship
CREATE TABLE patient_disease (
    patient_id TEXT,
    disease_id VARCHAR(3),
    FOREIGN KEY (patient_id) REFERENCES patient(id), 
    FOREIGN KEY (disease_id) REFERENCES disease(id)
);

-- Create sample table
CREATE TABLE sample (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    type TEXT,
    collection_date TEXT,
    patient_id TEXT,
    FOREIGN KEY (patient_id) REFERENCES patient(id)
);

-- Create dna table
CREATE TABLE dna (
    id TEXT PRIMARY KEY,
    amount REAL,
    purity REAL,
    sample_id INTEGER,
    FOREIGN KEY (sample_id) REFERENCES sample(id)
);

-- Create sequencer table
CREATE TABLE sequencer (
    id TEXT PRIMARY KEY,
    name TEXT
);

-- Create dna_sequencer table to establish one-to-many relationship
CREATE TABLE dna_sequencer (
    dna_id TEXT,
    sequencer_id TEXT,
    FOREIGN KEY (dna_id) REFERENCES dna(id),
    FOREIGN KEY (sequencer_id) REFERENCES sequencer(id)
);

-- Insert records into disease table
INSERT INTO disease (id, name, type) VALUES ('D01', 'Disease A', 'Type 1');
INSERT INTO disease (id, name, type) VALUES ('D02', 'Disease B', 'Type 2');
INSERT INTO disease (id, name, type) VALUES ('D03', 'Disease C', 'Type 1');

-- Insert records into patient table
INSERT INTO patient (id, age, sex) VALUES ('P01', 30, 'M');
INSERT INTO patient (id, age, sex) VALUES ('P02', 25, 'F');
INSERT INTO patient (id, age, sex) VALUES ('P03', 40, 'M');

-- Insert records into patient_disease table
INSERT INTO patient_disease (patient_id, disease_id) VALUES ('P01', 'D01');
INSERT INTO patient_disease (patient_id, disease_id) VALUES ('P02', 'D02');
INSERT INTO patient_disease (patient_id, disease_id) VALUES ('P03', 'D03');
INSERT INTO patient_disease (patient_id, disease_id) VALUES ('P01', 'D03');

-- Insert records into sample table
INSERT INTO sample (type, collection_date, patient_id) VALUES ('Blood', '2024-01-01', 'P01');
INSERT INTO sample (type, collection_date, patient_id) VALUES ('Tissue', '2024-01-02', 'P02');
INSERT INTO sample (type, collection_date, patient_id) VALUES ('Saliva', '2024-01-03', 'P03');

-- Insert records into dna table
INSERT INTO dna (id, amount, purity, sample_id) VALUES ('DNA01', 10.5, 0.98, 1);
INSERT INTO dna (id, amount, purity, sample_id) VALUES ('DNA02', 8.0, 0.95, 2);
INSERT INTO dna (id, amount, purity, sample_id) VALUES ('DNA03', 12.3, 0.99, 3);

-- Insert records into sequencer table
INSERT INTO sequencer (id, name) VALUES ('S01', 'Sequencer A');
INSERT INTO sequencer (id, name) VALUES ('S02', 'Sequencer B');

-- Insert records into dna_sequencer table
INSERT INTO dna_sequencer (dna_id, sequencer_id) VALUES ('DNA01', 'S01');
INSERT INTO dna_sequencer (dna_id, sequencer_id) VALUES ('DNA02', 'S02');
INSERT INTO dna_sequencer (dna_id, sequencer_id) VALUES ('DNA03', 'S01');

-- Query to select all diseases
SELECT * FROM disease;
