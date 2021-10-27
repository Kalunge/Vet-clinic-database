CREATE DATABASE vet_clinic;
CREATE TABLE animals(
  id INT PRIMARY KEY NOT NULL,
  name TEXT, 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN, 
  weight_kg DECIMAL
  );

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY(id)
);

ALTER TABLE animals 
ADD COLUMN species_id INT,
ADD CONSTRAINT species_fk 
FOREIGN KEY (species_id)
REFERENCES species(id) 
ON DELETE CASCADE;

ALTER TABLE animals 
ADD COLUMN owners_id INT,
ADD CONSTRAINT owners_fk 
FOREIGN KEY (owners_id)
REFERENCES owners(id) 
ON DELETE CASCADE;




