select
	extract(month from p.payment_date) as "Mês", -- extraio o mês da data de pagamento
	sum(p.amount) as "Faturamento"
from payment p 
group by "Mês"
order by "Faturamento" desc
limit 1

Mês|Faturamento|
---+-----------+
  4|   28559.46|