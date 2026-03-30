-- Calcule a taxa de retorno atrasado por cliente

select 
	c.* 
from customer c
join rental r on r.customer_id = c.customer_id
join inventory i on i.inventory_id = r.inventory_id
join film f on f.film_id = i.film_id
