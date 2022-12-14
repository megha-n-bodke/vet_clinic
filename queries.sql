/*Queries that provide answers to the questions from all projects.*/


SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* transactions */
/* Transaction1 */
BEGIN;
Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
UPDATE animals SET species = 'unspecified';
SELECT species from animals
ROLLBACK;
SELECT species from animals

/* Transaction2 */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT species from animals;
COMMIT;
SELECT species from animals;

/* Transaction3 */

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;


/* Transaction4 */

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

savepoint savepoint1;
Update all animals' weight to be their weight multiplied by -1.
update animals set weight_kg = weight_kg * -1;

rollback to savepoint savepoint1;

Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

/* Queries */
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals;
SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/* Query Multiple tables */


Insert the following data into the owners table:
Sam Smith 34 years old.
Jennifer Orwell 19 years old.
Bob 45 years old.
Melody Pond 77 years old.
Dean Winchester 14 years old.
Jodie Whittaker 38 years old.
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);


Write queries (using JOIN) to answer the following questions:
What animals belong to Melody Pond?
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';
List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals LEFT JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;


How many animals are there per species?
SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

List all Digimon owned by Jennifer Orwell.
select * from animals join owners on animals.owner_id = owners.id join species on animals.species_id = species.id where full_name = 'Jennifer Orwell' and species.name = 'Digimon';


List all animals owned by Dean Winchester that haven't tried to escape.
select * from animals join owners on animals.owner_id = owners.id where full_name = 'Dean Winchester' and escape_attempts = 0;
Who owns the most animals?
select full_name, count(*) from animals join owners on animals.owner_id = owners.id group by full_name order by count(*) desc limit 1;

/* relations */
Who was the last animal seen by William Tatcher?
select a.name from animals a join visits v on a.id=v.animal_id join vets on v.vets_id=vets.id where vets.name='William Tatcher'order by v.date desc limit 1;


How many different animals did Stephanie Mendez see?
select count(distinct a.name) from animals a join visits v on a.id=v.animal_id join vets on v.vets_id=vets.id where vets.name='Stephanie Mendez';


List all vets and their specializations, including vets with no specializations.
select vets.name, species.name from specializations join species on specializations.species_id=species.id full join vets on specializations.vets_id=vets.id;


List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select a.name from animals a join visits v on a.id=v.animal_id join vets on v.vets_id=vets.id where vets.name='Stephanie Mendez' and v.date between '2020-04-01' and '2020-08-30';
What animal has the most visits to vets?
select a.name, count(*) from animals a join visits v on a.id=v.animal_id group by a.name order by count(*) desc limit 1;
Who was Maisy Smith's first visit?
select animals.name from visits join animals on visits.animal_id=animals.id join vets on visits.vets_id=vets.id where vets.name='Maisy Smith'order by visits.date limit 1;


Details for most recent visit: animal information, vet information, and date of visit.
select animals.name, vets.name, visits.date from visits join animals on visits.animal_id=animals.id join vets on visits.vets_id=vets.id order by visits.date desc limit 1;

How many visits were with a vet that did not specialize in that animal's species?
select count(*) from visits join animals on visits.animal_id=animals.id join vets on visits.vets_id=vets.id join specializations on vets.id=specializations.vets_id where animals.species_id!=specializations.species_id;
What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select species.name from visits join animals on visits.animal_id=animals.id join vets on visits.vets_id=vets.id join specializations on vets.id=specializations.vets_id join species on specializations.species_id=species.id where vets.name='Maisy Smith' group by species.name order by count(*) desc limit 1;

