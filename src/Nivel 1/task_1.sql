select 
	f.title as "Título",
	c."name" as "Categoria",
	f.length  as "Duração",
	f.rental_rate as "Preço Aluguel"
from film f  
left join film_category fc on fc.film_id = f.film_id --pego o id de filme e faço um left join com film_category
left join category c on c.category_id = fc.category_id -- left join com a tabela category;


Título                     |Categoria  |Duração|Preço Aluguel|
---------------------------+-----------+-------+-------------+
Academy Dinosaur           |Documentary|     86|         0.99|
Ace Goldfinger             |Horror     |     48|         4.99|
Adaptation Holes           |Documentary|     50|         2.99|
Affair Prejudice           |Horror     |    117|         2.99|
African Egg                |Family     |    130|         2.99|
Agent Truman               |Foreign    |    169|         2.99|
Airplane Sierra            |Comedy     |     62|         4.99|
Airport Pollock            |Horror     |     54|         4.99|