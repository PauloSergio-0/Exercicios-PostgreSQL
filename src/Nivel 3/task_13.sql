select 
	ct.customer_id as "Cliente ID",
	concat(ct.first_name,' ' , ct.last_name) as "Nome",
	count(distinct c.category_id) as "Contagem categoria" --Contagem distinta para as categorias de filmes que o cliente alugou
from customer ct
	join rental r on r.customer_id = ct.customer_id
	join inventory i on i.inventory_id = r.inventory_id
	join film f on f.film_id = i.film_id 
	join film_category fc on fc.film_id = f.film_id
	join category c on c.category_id = fc.category_id
group by ct.customer_id, ct.first_name, ct.last_name
having count(distinct c.category_id) = (select count(*) from category)
order by ct.first_name asc, ct.last_name asc

| Cliente ID | Nome               | Contagem categoria |
| ---------- | ------------------ | ------------------ |
| 454        | Alex Gresham       | 16                 |
| 467        | Alvin Deloach      | 16                 |
| 522        | Arnold Havens      | 16                 |
| 400        | Bryan Hardison     | 16                 |
| 275        | Carole Barnett     | 16                 |
| 42         | Carolyn Perez      | 16                 |
| 566        | Casey Mena         | 16                 |
| 113        | Cindy Fisher       | 16                 |
| 144        | Clara Shaw         | 16                 |
| 28         | Cynthia Young      | 16                 |
| 368        | Harry Arce         | 16                 |
| 565        | Jaime Nettles      | 16                 |
| 270        | Leah Curtis        | 16                 |
| 484        | Roberto Vu         | 16                 |
| 204        | Rosemary Schmidt   | 16                 |
| 167        | Sally Pierce       | 16                 |
| 75         | Tammy Sanders      | 16                 |
| 595        | Terrence Gunderson | 16                 |
| 468        | Tim Cary           | 16                 |