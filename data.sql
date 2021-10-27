INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.0);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.0);


ALTER TABLE animals ADD COLUMN species TEXT

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(5, 'Charmander', '2020-02-08', 0, false, -11.0),
(6, 'Plantmon', '2022-11-15', 2, true, -5.7),
(7, 'Squirtle', '1993-04-02', 3, false, -12.13),
(8, 'Angemon', '2005-06-12', 1, true, -45.0),
(9, 'Boarmon', '2005-07-07', 7, true, 20.04),
(10, 'Blossom', '1998-10-13', 3, true, 17.0), ;

BEGIN;
UPDATE animals SET species = 'unspecified'
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon'
COMMIT;

BEGIN;
DELETE FROM animals
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Gabumon' OR name='Pikachu';
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name='Plantmon';
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name='Boarmon';

