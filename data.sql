/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon', '2020-05-24', 0, false, 10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon', '2020-03-15', 0, false, 4.5),
(3,'Pikachu', '2020-01-07', 0, false, 6.0),
(4,'Devimon', '2020-04-12', 0, true, 11.0);




INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander', '2020-02-08', 0, false, -11.0),
(6,'Plantmon', '2021-11-15', 2, true, -5.7),
(7,'Squirtle', '1993-04-02', 3, false, -12.13),
(8,'Angemon', '2005-06-12', 1, true, -45.0),
(9,'Boarmon', '2005-06-07', 7, true, 20.4),
(10,'Blossom', '1998-10-13', 3, true, 17.0),
(11,'Ditto', '2022-05-14', 4, true, 22.0);


Insert the following data into the species table:
Pokemon
Digimon
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
Modify your inserted animals so it includes the species_id value:
If the name ends in "mon" it will be Digimon
All other animals are Pokemon

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

Modify your inserted animals to include owner information (owner_id):
Sam Smith owns Agumon.
 UPDATE animals set owner_id = 1 WHERE name = 'Agumon';
Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals set owner_id = 2 WHERE name in ('Gabumon','Pikachu');
Bob owns Devimon and Plantmon.
UPDATE animals set owner_id = 3 WHERE name in ('Devimon','Plantmon');
Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals set owner_id = 4 WHERE name in ('Charmander','Squirtle','Blossom');
Dean Winchester owns Angemon and Boarmon.
UPDATE animals set owner_id = 5 WHERE name in ('Angemon','Boarmon');



