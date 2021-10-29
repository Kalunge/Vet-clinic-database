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
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
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


INSERT INTO vets (name , age, date_of_graduation) VALUES 
('William Tatcher',  45,'2000-04-23'),
('Maisy Smith',  26,'2019-01-17'),
('Stephanie Mendez',  64,'1981-05-04'),
('Jack Harkness',  38,'2008-08-06');


INSERT INTO specializations (vet_id, species_id) VALUES (1, 1), (3, 2), (3, 1), (4, 2);

SELECT vets.id, vets.name, species.name as specialty FROM vets JOIN specializations ON (vets.id = specializations.vet_id) JOIN species ON (species.id = specializations.species_id); 

INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES 
(1,  1,'2020-05-24'),
(3,  1,'2020-07-22'),
(4,  2,'2021-02-04'),
(2,  4,'2020-01-05'),
(2,  4,'2020-03-08'),
(2,  4,'2020-05-14'),
(3,  3,'2021-05-04'),
(4,  7,'2021-02-24'),
(2,  10,'2019-12-21'),
(1,  10,'2020-08-10'),
(2,  10,'2021-04-07'),
(3, 8,'2019-09-29'),
(4, 5,'2020-10-03'),
(4, 5,'2020-11-04'),
(2, 6,'2019-01-24'),
(2, 6,'2019-05-15'),
(2, 6,'2020-02-27'),
(2, 6,'2020-08-03'),
(3, 9,'2020-05-24'),
(1, 9,'2021-01-11');

SELECT vets.id, vets.name as visitor, animals.name, visits.date_of_visit as date_of_visit FROM animals JOIN visits ON (animals.id = visits.animal_id) JOIN vets ON (vets.id = visits.vet_id);



-- Agumon visited  1  on May 24th, 2020.  1
-- Agumon visited 3 on Jul 22th, 2020. 1
-- Gabumon visited 4 on Feb 2nd, 2021. 2
-- Pikachu visited 2 on Jan 5th, 2020.   4
-- Pikachu visited 2 on Mar 8th, 2020.   4
-- Pikachu visited 2 on May 14th, 2020    4.
-- Devimon visited 3 on May 4th, 2021.  3
-- Charmander visited 4 on Feb 24th, 2021. 7
-- Plantmon visited 2 on Dec 21st, 2019. 10
-- Plantmon visited  1 on Aug 10th, 2020. 10
-- Plantmon visited 2 on Apr 7th, 2021. 10 
-- Squirtle visited 3 on Sep 29th, 2019. 8
-- Angemon visited 4 on Oct 3rd, 2020. 5
-- Angemon visited 4 on Nov 4th, 2020. 5
-- Boarmon visited 2 on Jan 24th, 2019. 6
-- Boarmon visited 2 on May 15th, 2019.6
-- Boarmon visited 2 on Feb 27th, 2020.6
-- Boarmon visited 2 on Aug 3rd, 2020.6
-- Blossom visited 3 on May 24th, 2020. 9
-- Blossom visited  1 on Jan 11th, 2021. 9