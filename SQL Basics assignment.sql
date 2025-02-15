create database assignment ;
use assignment ;

/* 1. Create a table called employees with the following structure? 
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).
Write the SQL query to create the above table with all constraints. */

create table employees 
(emp_id int primary key , 
emp_name varchar(30) not null ,
age int check (age >=18),
email varchar (30) unique,
salary DECIMAL(10, 2) default (30000 )) ;

 /* 2. Explain the purpose of constraints and how they help maintain data integrity in a database.
 Provide examples of common types of constraints.
 
Constraints in SQL are rules that ensure data integrity by preventing invalid data from being entered into a database.
They help maintain the accuracy, consistency, and reliabilit of the data across the database.
Here are some key typesof constraints and how they contribute to data integrity 
1. Primary Key Constraint:  A primary key column cannot contain NULL values and must have unique values for each row.
2. Foreign Key Constraint: A foreign key constraint links a column in one table to the primary key in another table
3. Unique Constraint: This constraint ensures that all values in a column are distinct across all rows in a table.
4. Not NULL Constraint: This constraint ensures that a column cannot contain NULL values.
5. Check Constraint: This constraint allows you to specify a condition that must be true for all values in a column. 

from examples check question 1 */

/* 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.

The NOT NULL constraint is applied to a column to ensure that it cannot contain NULL values,
meaning every record in the database must have a value for that column
A primary key cannot contain NULL values because it uniquely identifies each record in a table. 
Allowing NULL values in a primary key would violate the uniqueness requirement, as NULL is not considered a distinct value in SQL. 
Therefore, primary keys are inherently NOT NULL to maintain the integrity and uniqueness of the data */

-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
-- example for both adding and removing a constraint.

alter table employees 
add gender char(7) ;

alter table employees 
drop gender ;

-- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.

-- insert
insert into employees values
(1, 'John Doe', 28, 'johndoe@example.com', 35000),
(2, 'Jane Smith', 35, 'janesmith@example.com', 40000),
(3, 'Emily Johnson', 22, 'emilyj@example.com', 30000),
(4, 'Michael Brown', 45, 'michaelb@example.com', 50000),
(5, 'Sarah Williams', 30, 'sarahw@example.com', 35000);

-- update
update employees 
SET email = 'emily.johnson@example.com'
WHERE emp_id = 3;

-- delete
delete  from  employees
where emp_id = 5 ;

-- 6. You created a products table without constraints as follows:

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));

-- Now, you realise that?
-- : The product_id should be a primary keyQ

alter table products 
add constraint product_id primary key (product_id);

-- : The price should have a default value of 50.00

alter table products 
alter column price set  default 50.00;

-- 7. You have two tables:
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

select  Students.student_name ,Classes.class_name  from 
Students inner join  Classes 
on Students.class_id =Classes.class_id ;

-- 8. Consider the following three tables:  Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
-- listed even if they are not associated with an order

select o.order_id, c.customer_name, p.product_name 
from Products p left join Orders o
on p.product_id = o.product_id
inner join  Customers c on o.customer_id = c.customer_id;


-- 9 Given the following tables: Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function

select  p.product_name, SUM(s.amount) AS total_sales
from Sales s inner join Products p 
on s.product_id = p.products
group by p.product_name;

-- 10. You are given three tables  Write a query to display the order_id, customer_name, and the quantity of products ordered by each
-- customer using an INNER JOIN between all three tables.

select o.order_id, c.customer_name, oi.quantity
from Orders o
inner join  Customers c on o.customer_id = c.customer_id
inner join  Order_Items oi on o.order_id = oi.order_id
inner join Products p on oi.product_id = p.product_id;


-- SQL Commands

use mavenmovies;

/* 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

1. Movies Table
Columns: movie_id, title, release_year, genre_id, director_id
Primary Key: movie_id — Uniquely identifies each movie.
Foreign Key: genre_id — Refers to the genre of the movie in the Genres table.
Foreign Key: director_id — Refers to the director of the movie in the Directors table.

2. Genres Table
Columns: genre_id, genre_name
Primary Key: genre_id — Uniquely identifies each genre.

3. Directors Table
Columns: director_id, director_name
Primary Key: director_id — Uniquely identifies each director.

Differences Between Primary Keys and Foreign Keys:
Purpose:

Primary Key: Uniquely identifies each row in a table. Each table can have only one primary key.
Foreign Key: Establishes a relationship between two tables, referencing the primary key of another table. A table can have multiple foreign keys.
Uniqueness:

Primary Key: Must be unique for every record and cannot have NULL values.
Foreign Key: Does not need to be unique and can have duplicate values. It can also contain NULL values if the relationship is optional.
Table Structure:

Primary Key: Is defined within the same table.
Foreign Key: Is defined in the table where the relationship is being established, and it points to the primary key in another table.
Referential Integrity:

Primary Key: Ensures the uniqueness and integrity of the data in the same table.
Foreign Key: Ensures referential integrity, meaning that a foreign key value in one table must match a value in the referenced primary key column, ensuring that the data is consistent across related tables.

*/
-- 2- List all details of actors

select * from actor;

-- 3 -List all customer information from DB.

select * from customer;

-- 4 -List different countries.

select country from country;

-- 5 -Display all active customers. 

select * from customer
where active = 1;
 
 -- 6 -List of all rental IDs for customer with ID 1.
 
 select * from rental
 where customer_id like "1%" ;
 
 -- 7 - Display all the films whose rental duration is greater than 5 .
 
 select *  from film
 where rental_duration = 5;
 
 -- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
 
  select count(title)  from film
 where replacement_cost > 15 and replacement_cost < 20;
 
 -- 9 - Display the count of unique first names of actors.
 
 select count(distinct first_name)as unique_first_names_count  from actor_award ;
 
 
-- 10- Display the first 10 records from the customer table .

select * from customer 
limit 10 ;
 
-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.

 select * from customer 
where first_name like "b%"
limit 3 ;

-- 12 -Display the names of the first 5 movies which are rated as ‘G

select * from film
where rating like "G%"
limit 5 ;

-- 13-Find all customers whose first name starts with "a".

select * from customer
where first_name like "G%" ;

-- 14- Find all customers whose first name ends with "a".

select * from customer
where first_name like "%a" ;

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
 
 select * from customer
where first_name like "a%" 
limit 4;

-- 16- Find all customers whose first name have "NI" in any position.

select * from customer
where first_name like "NI%" ;

 -- 17- Find all customers whose first name have "r" in the second position .
 
 select * from customer
where first_name like "_r%" ;

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.

 select * from customer
where first_name like "a_____%" ;

-- 19- Find all customers whose first name starts with "a" and ends with "o".

 select * from customer
where first_name like "a%o" ;

-- 20 - Get the films with pg and pg-13 rating using IN operator.

select * from film
where rating in ("PG" ,"PG-13")  ;

-- 21 - Get the films with length between 50 to 100 using between operator.

select * from film
where length between 50 and 100  ;

-- 22 - Get the top 50 actors using limit operator.

select * from actor limit 50 ;

-- 23 - Get the distinct film ids from inventory table.

 select distinct film_id from inventory;
 
 
/*  Function */
 
 -- Basic Aggregate Functions:

 -- Question 1: Retrieve the total number of rentals made in the Sakila database.

select count(*) as total_rental from rental ;

 -- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
 
 select avg(rental_duration) as average_rental_duration from film ;

  -- Question 3: Display the first name and last name of customers in uppercase
 
 select  upper(first_name) as upper_frist_name,
		 upper(last_name) as upper_last_name
from customer; 

 -- Question 4: Extract the month from the rental date and display it alongside the rental ID.

select month(rental_date) as rental_month , rental_id from rental ;

/* GROUP BY: */

 -- Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
 
SELECT 
	customer_id, COUNT(rental_id) AS rental_count
FROM
	rental
GROUP BY customer_id;
 
 -- Question 6: Find the total revenue generated by each store.
 
select s.store_id, sum(p.amount) as total_revenue
from payment p
join staff st on p.staff_id = st.staff_id
join store s on st.store_id = s.store_id
group by s.store_id;

-- Question 7: Determine the total number of rentals for each category of movies.
 
		select c.name AS category, COUNT(r.rental_id) AS total_rentals
		from rental r
		join inventory i on r.inventory_id = i.inventory_id
		join film f on i.film_id = f.film_id
		join film_category fc on f.film_id = fc.film_id
		join category c on fc.category_id = c.category_id
		group by c.name
		order by total_rentals DESC;

-- Question 8: Find the average rental rate of movies in each language.

	select l.name as language , avg(f.rental_rate) as avg_rental_rate
	from film f
	join language l on f.language_id = l.language_id
	group by l.name
	order by avg_rental_rate DESC;

/*Joins */

--  Questions 9 -Display the title of the movie, customer s first name, and last name who rented it 

select f.title as  movie_title, c.first_name, c.last_name
from  rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join customer c on r.customer_id = c.customer_id
order by f.title, c.last_name, c.first_name;

-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind"

select a.first_name, a.last_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.title = 'gone with the wind';

--  Question 11: Retrieve the customer names along with the total amount they've spent on rentals'

select c.first_name, c.last_name, sum(p.amount) as total_spent
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_spent desc;

  -- Question 12:  List the titles of movies rented by each customer in a particular city (e.g., 'London')

select c.first_name, c.last_name, ci.city, f.title
from rental r
join customer c on r.customer_id = c.customer_id
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where ci.city = 'london'
order by c.last_name, c.first_name, f.title;

/* Advanced Joins and GROUP BY: */

 -- Question 13: Display the top 5 rented movies along with the number of times they've been rented.

select f.title, count(r.rental_id) as rental_count
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by f.title
order by rental_count desc
limit 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).

select c.first_name, c.last_name, c.customer_id
from customer c
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
where i.store_id in (1, 2)
group by c.customer_id, c.first_name, c.last_name
having count(distinct i.store_id) = 2
order by c.last_name, c.first_name;


/* Windows Function: ---*/

-- 1. Rank the customers based on the total amount they've spent on rentals.

select c.first_name, c.last_name, sum(p.amount) as total_spent,
       rank() over (order by sum(p.amount) desc) as rank_amount
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_spent desc;

-- 2. Calculate the cumulative revenue generated by each film over time.

select f.title, p.payment_date, sum(p.amount) over (partition by f.film_id order by p.payment_date) as cumulative_revenue
from payment p
join rental r on p.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
order by f.title, p.payment_date;

-- 3. Determine the average rental duration for each film, considering films with similar lengths.

select f.length, avg(datediff(r.return_date, r.rental_date)) as avg_rental_duration
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by f.length
order by f.length;

-- 4. Identify the top 3 films in each category based on their rental counts.

select c.name as category, f.title, count(r.rental_id) as rental_count,
       rank() over (partition by c.name order by count(r.rental_id) desc) as rank_rental_id
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name, f.title
order by c.name, rank_rental_id
 limit 3;
 
 -- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentalsacross all customers.

select c.first_name, c.last_name, 
       count(r.rental_id) - (select avg(cnt) from (select count(rental_id) as cnt from rental group by customer_id) x) 
       as rental_difference
from 
customer c join rental r on c.customer_id = r.customer_id
group by c.customer_id;

-- 6. Find the monthly revenue trend for the entire rental store over time.

select date_format(payment_date, '%Y-%m') as month, sum(amount) as total_revenue
from payment
group by month
order by month;


-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

/* select c.first_name, c.last_name, sum(p.amount) as total_spent
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id
order by total_spent desc
limit (select count(distinct customer_id) * 0.2 from customer);   */


select c.first_name, c.last_name, 
       count(r.rental_id) as total_rentals,
       round((count(r.rental_id) / (select count(*) from rental)) * 100, 2) as rental_percentage
from customer c
join rental r on c.customer_id = r.customer_id
group by c.customer_id
order by rental_percentage desc;



-- 8. Calculate the running total of rentals per category, ordered by rental count.

select c.name as category, count(r.rental_id) as rental_count,
       sum(count(r.rental_id)) over (partition by c.name order by count(r.rental_id) desc) as running_total
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name, f.film_id
order by c.name, rental_count desc;

-- 9. Find the films that have been rented less than the average rental count for their respective categories.

select f.title, c.name as category, count(r.rental_id) as rental_count
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.film_id, c.name
having rental_count < (
    select avg(rental_count)
    from (select fc.category_id, count(r.rental_id) as rental_count
          from film_category fc
          join inventory i on fc.film_id = i.film_id
          join rental r on i.inventory_id = r.inventory_id
          group by fc.category_id, fc.film_id) as avg_rental_per_category
    where avg_rental_per_category.category_id = fc.category_id
)
order by c.name, rental_count asc;

-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month

select date_format(payment_date, '%Y-%m') as month, sum(amount) as total_revenue
from payment
group by month
order by total_revenue desc
limit 5;

/* Normalisation & CTE */

-- 1. First Normal Form (1NF):
-- a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF

describe film_text;

-- Violation of 1NF
-- The description column can contain multiple values (e.g., a list of genres, actors, or multiple descriptions).
-- If a film has multiple descriptions, they might be stored in one column, making it non-atomic

-- 2. Second Normal Form (2NF):
-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.

describe film_actor;

-- Primary Key: (actor_id, film_id) (composite key).
-- actor_id & film_id together uniquely identify each record 
-- last_update depends only on film_id, not on both film_id and actor_id 
-- This creates a partial dependency, violating 2NF.

-- 3. Third Normal Form (3NF):
-- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.

describe customer;

/* Primary Key: customer_id 

Dependency Analysis:

first_name, last_name, email, active, and create_date depend only on customer_id  (No issue).
store_id is directly related to the store where the customer is registered  (No issue).
Issue: address_id indirectly contains city, country, and postal code information, which means these values are stored in the address table.
Transitive Dependency:

customer → address_id  (Direct dependency on primary key)
address_id → city_id → country_id  (Transitive dependency)
city_name and country_name should not be indirectly stored in customer through address_id. */

-- 4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.

-- Step 1: Choosing a Table - rental The rental table stores information about movie rentals by customers.
-- Step 2: Unnormalized Form An unnormalized table (UNF) contains repeating groups, non-atomic values, or missing primary keys.
-- Step 3: Convert to First Normal Form
-- Step 4: Convert to Second Normal Form (2NF) 
-- if you want code you use chatgpt

-- 5. CTE Basics:
 -- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.

with actor_film_count as (
    select fa.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    from film_actor fa
    join actor a on fa.actor_id = a.actor_id
    group by fa.actor_id, a.first_name, a.last_name
)
select * from actor_film_count
order by film_count desc;

-- 6. CTE with Joins:
 -- a. Create a CTE that combines information from the film and language tables to display the film title,  language name, and rental rate.

with film_language_cte as (
    select f.title, l.name as language_name, f.rental_rate
    from film f
    join language l on f.language_id = l.language_id
)
select * from film_language_cte
order by title;

-- 7 CTE for Aggregation:
 -- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments)  from the customer and payment tables.

with customer_revenue as (
    select p.customer_id, c.first_name, c.last_name, sum(p.amount) as total_revenue
    from payment p
    join customer c on p.customer_id = c.customer_id
    group by p.customer_id, c.first_name, c.last_name
)
select * from customer_revenue
order by total_revenue desc;

-- 8 CTE with Window Functions
 -- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

with film_rank_cte as (
    select film_id, title, rental_duration,
           rank() over (order by rental_duration desc) as rank_film
    from film
)
select * from film_rank_cte
order by rank_film;

-- 9 CTE and Filtering
 -- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details

with frequent_customers as (
    select r.customer_id, count(r.rental_id) as rental_count
    from rental r
    group by r.customer_id
    having count(r.rental_id) > 2
)
select c.customer_id, c.first_name, c.last_name, c.email, fc.rental_count
from frequent_customers fc
join customer c on fc.customer_id = c.customer_id
order by fc.rental_count desc;

-- 10 CTE for Date Calculations:
 -- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table

with monthly_rentals as (
    select date_format(rental_date, '%Y-%m') as rental_month, count(rental_id) as total_rentals
    from rental
    group by rental_month
)
select * from monthly_rentals
order by rental_month;

-- 11 CTE and Self-Join:
 -- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
 
 with actor_pairs as (
    select fa1.actor_id as actor1, fa2.actor_id as actor2, fa1.film_id
    from film_actor fa1
    join film_actor fa2 on fa1.film_id = fa2.film_id
    where fa1.actor_id < fa2.actor_id
)
select a1.first_name || ' ' || a1.last_name as actor1_name, 
       a2.first_name || ' ' || a2.last_name as actor2_name, 
       ap.film_id
from actor_pairs ap
join actor a1 on ap.actor1 = a1.actor_id
join actor a2 on ap.actor2 = a2.actor_id
order by ap.film_id, actor1_name, actor2_name;

-- 12. CTE for Recursive Search:
 -- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column

with recursive staff_hierarchy as (
    -- Start with the manager (change staff_id to the desired manager)
    select staff_id, first_name, last_name, reports_to, 1 as level
    from staff
    where staff_id = 1  -- Change this to the specific manager ID

    union all

    -- Recursively find employees reporting to the previous level
    select s.staff_id, s.first_name, s.last_name, s.reports_to, sh.level + 1
    from staff s
    join staff_hierarchy sh on s.reports_to = sh.staff_id
)
select * from staff_hierarchy
order by level, staff_id;


