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


/* relations */
Insert the following data for vets:
Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

insert into vets (name,age,date_of_graduation) values ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

Insert the following data for specialties:
Vet William Tatcher is specialized in Pokemon.
Vet Stephanie Mendez is specialized in Digimon and Pokemon.
Vet Jack Harkness is specialized in Digimon.

insert into specializations (vet_id, species_id) values (1, 1), (3, 1), (3, 2), (4, 2);


Insert the following data for visits:
Agumon visited William Tatcher on May 24th, 2020.
Agumon visited Stephanie Mendez on Jul 22th, 2020.
Gabumon visited Jack Harkness on Feb 2nd, 2021.
Pikachu visited Maisy Smith on Jan 5th, 2020.
Pikachu visited Maisy Smith on Mar 8th, 2020.
Pikachu visited Maisy Smith on May 14th, 2020.
Devimon visited Stephanie Mendez on May 4th, 2021.
Charmander visited Jack Harkness on Feb 24th, 2021.
Plantmon visited Maisy Smith on Dec 21st, 2019.
Plantmon visited William Tatcher on Aug 10th, 2020.
Plantmon visited Maisy Smith on Apr 7th, 2021.
Squirtle visited Stephanie Mendez on Sep 29th, 2019.
Angemon visited Jack Harkness on Oct 3rd, 2020.
Angemon visited Jack Harkness on Nov 4th, 2020.
Boarmon visited Maisy Smith on Jan 24th, 2019.
Boarmon visited Maisy Smith on May 15th, 2019.
Boarmon visited Maisy Smith on Feb 27th, 2020.
Boarmon visited Maisy Smith on Aug 3rd, 2020.
Blossom visited Stephanie Mendez on May 24th, 2020.
Blossom visited William Tatcher on Jan 11th, 2021.

insert into visits(animal_id, vets_id, date) values (1, 1, '2020-05-24'), 
(1, 3, '2020-07-22'), (2, 4, '2021-02-02'), 
(3, 2, '2020-01-05'), (3, 2, '2020-03-08'),
 (3, 2, '2020-05-14'), (4, 3, '2021-05-04'), 
 (5, 4, '2021-02-24'), (6, 2, '2019-12-21'),
  (6, 1, '2020-08-10'), (6, 2, '2021-04-07'), 
  (7, 3, '2019-09-29'), (8, 4, '2020-10-03'), 
  (8, 4, '2020-11-04'), (9, 2, '2019-01-24'), 
  (9, 2, '2019-05-15'), (9, 2, '2020-02-27'), 
  (9, 2, '2020-08-03'), (10, 3, '2020-05-24'), 
  (10, 1, '2021-01-11');