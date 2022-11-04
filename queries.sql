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
ROLLBACK;

/* Transaction2 */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

/* Transaction3 */

BEGIN;
DELETE FROM animals;
ROLLBACK;

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






