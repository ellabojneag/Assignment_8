-- 1a. Display the first and last names of all actors from the table actor.
USE SAKILA;
SELECT first_name, last_name FROM actor;

-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column ACTOR NAME 
SELECT concat(first_name,' ' ,last_name) As 'ACTOR NAME'  From actor; 

-- 2a. You need to find the ID number, first name, and last name of an actor,
-- of whom you know only the first name, "Joe." What is one query would you use
-- to obtain this information?
SELECT actor_id, first_name, last_name FROM actor where first_name = "JOE";

-- 2b. Find all actors whose last name contain the letters GEN:
SELECT first_name, last_name FROM actor where last_name like '%GEN%';

-- 2c. Find all actors whose last names contain the letters LI. 
-- This time, order the rows by last name and first name, in that order:
SELECT first_name, last_name FROM actor where last_name  like '%LI%' order by last_name, first_name;

-- 2d. Using IN, display the country_id and country columns of the following 
-- countries: Afghanistan, Bangladesh, and China:
SELECT country_id, country FROM country where country in ('Afghanistan', 'Bangladesh', 'China');

-- 3a. Add a middle_name column to the table actor. 
-- Position it between first_name and last_name. Hint: you will need to specify the data type.
ALTER TABLE actor drop column middle_name;
ALTER TABLE actor add column middle_name varchar(100) AFTER first_name;

-- 3b. You realize that some of these actors have tremendously long last names.
--  Change the data type of the middle_name column to blobs.
ALTER TABLE actor modify COLUMN middle_name blob;

-- 3c. Now delete the middle_name column 
ALTER TABLE actor drop column middle_name; 

-- 4a. List the last names of actors, as well as how many actors have that last name.
Select last_name, count(*) as 'total' From actor Group by last_name ;

-- 4b. List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors
Select last_name, count(*) as 'total' From actor Group by last_name Having total > 2;

-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table 
-- as GROUCHO WILLIAMS, the name of Harpo's second cousin's husband's yoga teacher.
-- Write a query to fix the record.
Update actor set first_name= 'HARPO' where first_name = 'Groucho' and last_name = 'Williams' ;



    
    





