select 
	c.customer_id as "ID" ,
	c.first_name as "Cliente",
	c.last_name as "Sobrenome",
	sum(p.amount) as "Gasto Total" -- função para somar toda a coluna
from customer c
join payment p on p.customer_id = c.customer_id 
group by c.customer_id ,c.first_name -- agrupo por nome de cliente
order by sum(p.amount) desc 
limit 10;  -- limito a 10 linhas

ID |Cliente|Sobrenome|Gasto Total|
---+-------+---------+-----------+
148|Eleanor|Hunt     |     211.55|
526|Karl   |Seal     |     208.58|
178|Marion |Snyder   |     194.61|
137|Rhonda |Kennedy  |     191.62|
144|Clara  |Shaw     |     189.60|
459|Tommy  |Collazo  |     183.63|
181|Ana    |Bradley  |     167.67|
410|Curtis |Irby     |     167.62|
236|Marcia |Dean     |     166.61|
403|Mike   |Way      |     162.67|