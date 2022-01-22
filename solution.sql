-- 1.Write a query to display for each store its store ID, city, and country
  
  select s.store_id,c.city,co.country
  from sakila.store s
  join sakila.address a
  on s.address_id = a.address_id
  join sakila.city c
  on a.city_id = c.city_id
  join sakila.country co 
  on co.country_id = c.country_id;



-- 2.Write a query to display how much business, in dollars, each store brought in

   select s.store_id as `Store`,round(sum(p.amount)) as `Total Amount`
   from sakila.staff s
   join sakila.payment p 
   on s.staff_id = p.staff_id
   group by s.store_id
   Order by `Total Amount`;     



-- 3.What is the average running time of films by category?

  select c.name as `Category`,floor(AVG(f.length))as `Average Running time of film`
  from sakila.film f
  join sakila.film_category fc
  on f.film_id = fc.film_id
  join sakila.category c 
  on fc.category_id = c.category_id
  group by `Category`;



-- 4.Which film categories are longest?
  
  select c.name as `Category`, floor(AVG(f.length))as `Average Running time of film`
  from sakila.film f
  join sakila.film_category fc
  on f.film_id = fc.film_id
  join sakila.category c 
  on fc.category_id = c.category_id
  group by `Category`
  order by AVG(f.length) desc
  Limit 5;



-- 5.Display the most frequently rented movies in descending order
  
  select f.title as `film`,count(r.rental_id) as `Number of rentals`
  from sakila.film f
  join sakila.inventory i 
  on f.film_id = i.film_id
  join sakila.rental r 
  on i.inventory_id = r.inventory_id
  group by `film`
  Order by `Number of rentals` desc;



-- 6.List the top five genres in gross revenue in descending order

  select c.name as `Category`,sum(p.amount) as `Gross Revenue`
  from sakila.category c
  join sakila.film_category fc
  on c.category_id = fc.category_id
  join sakila.inventory i
  on i.film_id = fc.film_id
  join sakila.rental r 
  on r.inventory_id = i.inventory_id
  join sakila.payment p
  on p.rental_id = r.rental_id 
  group by c.name
  Order by `Gross Revenue` desc       
  Limit 5;
  


-- 7.Is "Academy Dinosaur" available for rent from Store 1?
 
 select i.store_id,f.title,count(i.inventory_id)
 from film f
 join inventory i 
 on f.film_id = i.film_id
 where f.title = 'Academy Dinosaur' and i.store_id = 1
 group by f.title;


