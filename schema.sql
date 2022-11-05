/* Database schema to keep the structure of entire database. */
create database vet_clinic;

CREATE TABLE animals (
    id integer primary key,
    name varchar(100) not null,
    date_of_birth date not null,
    escape_attempts integer not null,
    neutered boolean not null,
    weight_kg decimal not null
);

Add a column species of type string to your animals table. Modify your schema.sql file.
AFTER TABLE animals ADD COLUMN species varchar(100);


/* Primary and FOREIGN key */
Create a table named owners with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
full_name: string
age: integer

Create table owners (
id serial PRIMARY KEY not null,
full_name varchar(255) not null,
age integer not null
);

 
Create a table named species with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string

create table species (id serial PRIMARY KEY not null, name varchar(255) not null);


Modify animals table:
Make sure that id is set as autoincremented PRIMARY KEY
ALTER  TABLE animals Update id serial PRIMARY KEY not null;
Remove column species
ALTER TABLE animals DROP COLUMN species;
select species from animals;
Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id integer REFERENCES species(id);
Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id integer REFERENCES owners(id);
select owner_id from animals;


/* Relations */
Create a table named vets with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string
age: integer
date_of_graduation: date

create table vets (
id serial PRIMARY KEY not null, 
name varchar(255) not null,
age integer not null,
date_of_graduation date not null
);

There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship
create table specializations(species_id int references species(id),vets_id int references vets(id));

There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
create table visits (animal_id int references animals(id),vets_id int references vets(id),date date not null);