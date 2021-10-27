SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <=17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals  WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;




SELECT name, full_name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.id = 4;
SELECT a.name as animal, s.name as type FROM animals a INNER  JOIN species s ON a.species_id = s.id WHERE  s.name = 'Pokemon';
SELECT full_name as owner, name as animal FROM owners LEFT JOIN animals ON owners.id = animals.owners_id; 
SELECT COUNT(a), s.name FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT name FROM animals JOIN owners on animals.owners_id = owners.id WHERE full_name = 'Jennifer Orwell' AND species_id=2;
SELECT name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE escape_attempts < 1 AND full_name = 'Dean Winchester';
SELECT full_name, COUNT(name) AS num_of_animals FROM animals JOIN owners ON owners.id = animals.owners_id GROUP BY full_name ORDER BY num_of_animals DESC LIMIT 1;