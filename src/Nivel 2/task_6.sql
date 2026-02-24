select 
	 concat('Loja ',s.store_id) as "Lojas" ,
	 count(distinct r.customer_id) as "Clientes",
	 count(distinct r.rental_id) as "Total de Alugueis",
	 sum(p.amount) as "Total Arrecadado"
from store s 
left join customer c  on c.store_id = s.store_id 
left join rental r on r.customer_id  = c.customer_id 
left join payment p on p.rental_id  = r.rental_id  
group by s.store_id
order by s.store_id asc;


Lojas |Clientes|Total de Alugueis|Total Arrecadado|
------+--------+-----------------+----------------+
Loja 1|     326|             8747|        33626.39|
Loja 2|     273|             7297|        27685.65|