USE sakila;

SELECT * FROM category;
SELECT * FROM film_category;
SELECT * FROM film;

SELECT * FROM film_category
WHERE category_id = (SELECT category_id FROM category WHERE category.name = 'Action')
;

SELECT * FROM film
WHERE description
REGEXP (SELECT name FROM category WHERE category.name = 'Action');

SELECT title
 FROM film
 WHERE film_id IN
  (SELECT film_category.film_id
   FROM film_category  INNER JOIN category 
   ON film_category.category_id = category.category_id
  WHERE category.name = 'Action');

SELECT title
FROM film 
WHERE EXISTS
 (SELECT 1
 FROM film_category  INNER JOIN category 
ON film_category.category_id = category.category_id
WHERE category.name = 'Action'
 AND film_category.film_id = film.film_id);
 
SELECT actr.actor_id, grps.level
FROM
(SELECT actor_id, count(*) num_roles
FROM film_actor
GROUP BY actor_id
 ) actr
 INNER JOIN
 (SELECT 'Hollywood Star' AS level, 30 min_roles, 99999 max_roles
 UNION ALL
 SELECT 'Prolific Actor' AS level, 20 min_roles, 29 max_roles
 UNION ALL
 SELECT 'Newcomer' AS level, 1 min_roles, 19 max_roles
 ) grps
  ON actr.num_roles BETWEEN grps.min_roles AND grps.max_roles;
  
SELECT   fa.actor_id
,        fa.film_id
FROM     film_actor fa
WHERE    fa.actor_id IN	
           (SELECT actor_id FROM actor WHERE last_name = 'MONROE')
AND      fa.film_id IN
           (SELECT film_id FROM film WHERE rating = 'PG');


SELECT ai.actor_id, fi.film_id  FROM (SELECT actor_id FROM actor WHERE last_name = 'MONROE')ai 
CROSS JOIN
(SELECT film_id FROM film WHERE rating= 'PG')fi;

SELECT * FROM actor; -- I can obtain the actor_id
SELECT * FROM film_actor; 
select * from film; -- I can obtain the film_id

SELECT actor_id, film_id
FROM film_actor
 WHERE (actor_id, film_id) IN
  (SELECT a.actor_id, f.film_id
    FROM actor a
    CROSS JOIN film f
     WHERE a.last_name = 'MONROE'
 AND f.rating = 'PG');
 
 
SELECT actor_id, film_id
FROM film_actor
WHERE (actor_id, film_id) IN
(SELECT a.actor_id, f.film_id
FROM actor a
CROSS JOIN film f
WHERE a.last_name = 'MONROE'
AND f.rating = 'PG');

SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE fa.actor_id IN(SELECT actor_id FROM actor WHERE last_name = 'MONROE')
AND  fa.film_id IN (SELECT film_id FROM film WHERE rating = 'PG');

SELECT a.actor_id, a.film_id
FROM film_actor a
 WHERE EXISTS
 (SELECT 1
FROM actor fa
 INNER JOIN film f ON f.film_id = fa.actor_id
 WHERE fa.actor_id = a.actor_id AND last_name = 'MONROE'
  AND (SELECT f.rating = 'PG'));
-- a correlated one
SELECT title
FROM film 
WHERE EXISTS
 (SELECT 1
 FROM film_category  INNER JOIN category 
ON film_category.category_id = category.category_id
WHERE category.name = 'Action'
 AND film_category.film_id = film.film_id);
