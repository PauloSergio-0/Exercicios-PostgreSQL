with
faturamento_mensal as (
	select
		date_trunc('month', p.payment_date) as "mês",
		sum(p.amount) as faturamento 
	from payment p
		group by "mês"
)
select
	fm."mês",
	fm.faturamento,
	sum(faturamento) over(order by fm."mês" asc) as "faturamento acumulado" -- com a função "over" posso caucular linha a linha, e soma os valores da linha atula com as anteriores
from faturamento_mensal fm

| mês                 | faturamento | faturamento acumulado |
| ------------------- | ----------- | --------------------- |
| 2007-02-01 00:00:00 | 8351.84     | 8351.84               |
| 2007-03-01 00:00:00 | 23886.56    | 32238.40              |
| 2007-04-01 00:00:00 | 28559.46    | 60797.86              |
| 2007-05-01 00:00:00 | 514.18      | 61312.04              |