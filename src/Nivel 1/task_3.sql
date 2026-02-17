select 
	c.name as "Categoria",
	count(*) "Total de filmes"  
from film f  
left join film_category fc on fc.film_id = f.film_id --pego o id de filme e faço um left join com film_category
left join category c on c.category_id = fc.category_id -- left join com a tabela category
group by c.name
order by "Total de filmes" desc;

Categoria  |Total de filmes|
-----------+---------------+
Sports     |             74|
Foreign    |             73|
Family     |             69|
Documentary|             68|
Animation  |             66|
Action     |             64|
New        |             63|
Drama      |             62|
Sci-Fi     |             61|
Games      |             61|
Children   |             60|
Comedy     |             58|
Travel     |             57|
Classics   |             57|
Horror     |             56|
Music      |             51|