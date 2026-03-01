select 
	c.customer_id as "ID",
	c.first_name as "Nome",
	c.last_name as "Sobrenome",
	count(p.customer_id) as "Total de Alugueis", 
	round(avg(p.amount)::numeric, 2) as "Media de valor pago em alugueis" -- função de média limitando as casas decimais
from customer c
join payment p on p.customer_id = c.customer_id 
group by "ID", "Nome", "Sobrenome"
order by "Total de Alugueis" asc, "Media de valor pago em alugueis" asc


ID |Nome       |Sobrenome  |Total de Alugueis|Media de valor pago em alugueis|
---+-----------+-----------+-----------------+-------------------------------+
318|Brian      |Wyman      |                7|                           3.99|
281|Leona      |Obrien     |               10|                           3.29|
110|Tiffany    |Jordan     |               12|                           4.16|
248|Caroline   |Bowman     |               13|                           2.91|
 61|Katherine  |Rivera     |               13|                           4.45|
272|Kay        |Caldwell   |               13|                           5.07|
310|Daniel     |Cabral     |               13|                           5.30|
124|Sheila     |Wells      |               14|                           4.13|
136|Anita      |Morales    |               14|                           4.28|
 48|Ann        |Evans      |               14|                           4.85|
315|Kenneth    |Gooden     |               14|                           4.85|
464|Jerome     |Kenyon     |               14|                           4.85|
320|Anthony    |Schwab     |               15|                           3.19|
250|Jo         |Fowler     |               15|                           3.66|