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


SELECT  animals.name, date_of_visit FROM animals JOIN visits ON (animals.id = visits.vet_id) JOIN vets ON (vets.id = visits.animal_id) WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(animals.species_id) FROM animals JOIN visits ON (animals.id = visits.animal_id) JOIN vets ON (vets.id = visits.vet_id) WHERE vets.name = 'Stephanie Mendez' GROUP BY animals.species_id;
SELECT vets.name, species.name AS specialty FROM vets LEFT JOIN specializations ON (vets.id = specializations.vet_id) LEFT JOIN species ON (species.id = specializations.species_id);
SELECT vets.name as vet, animals.name as animal, date_of_visit FROM animals JOIN visits ON(animals.id = visits.animal_id) JOIN vets ON (vets.id = visits.vet_id) WHERE vets.name = 'Stephanie Mendez' and date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name, COUNT(*) as visits FROM animals JOIN visits ON (animals.ID = visits.animal_id) GROUP BY 1 ORDER BY visits DESC LIMIT 1;
SELECT animals.name as visitor FROM animals JOIN visits ON (animals.id = visits.animal_id) JOIN vets ON (vets.id = visits.vet_id) WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;
SELECT animals.id as animal_id, animals.name as animal, vets.name as vet, date_of_visit FROM animals JOIN visits ON (animals.id = visits.animal_id) JOIN vets ON (vets.id = visits.vet_id) ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(vets.name) FROM vets JOIN specializations ON (vets.id = specializations.vet_id) JOIN visits ON (vets.id = visits.vet_id) JOIN animals ON (animals.id = visits.animal_id) WHERE specializations.species_id != animals.species_id;
SELECT COUNT(*) as total_specialty FROM vets JOIN visits ON (vets.id = visits.vet_id) JOIN animals ON (animals.id = visits.animal_id) WHERE vets.name = 'Maisy Smith' GROUP BY animals.species_id ORDER BY total_specialty DESC LIMIT 1;
