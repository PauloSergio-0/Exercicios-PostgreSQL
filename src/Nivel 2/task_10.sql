select
	f.film_id  as "ID", 
	f.title as "Titulo",
	SUM(p.amount) as "Receita"
from film f 
join inventory i on i.film_id = f.film_id 
join rental r on r.inventory_id = i.inventory_id 
join payment p on p.rental_id = r.rental_id
group by f.film_id ,f.title
order by SUM(p.amount) desc
limit 5

ID  |Titulo          |Receita|
----+----------------+-------+
 879|Telegraph Voyage| 215.75|
1000|Zorro Ark       | 199.72|
 973|Wife Turn       | 198.73|
 460|Innocent Usual  | 191.74|
 444|Hustler Party   | 190.78|