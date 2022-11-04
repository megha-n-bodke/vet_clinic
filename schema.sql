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