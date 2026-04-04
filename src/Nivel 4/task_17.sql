with 
faturamento_mensal as (
	select
		date(date_trunc('month', p.payment_date)) as "Mês",
		sum(p.amount) as "Faturamento"
	from payment p 
	group by "Mês" 
)select 
	fm."Mês",
	fm."Faturamento",
	lag(fm."Faturamento" ) over(order by "Mês") as faturamento_mes_anterior,
	concat(round(((fm."Faturamento" - lag(fm."Faturamento") over(order by fm."Mês")) 
	/ lag(fm."Faturamento" ) over(order by "Mês")) * 100,2),'%') as "Variação"
from faturamento_mensal  fm

Mês       |Faturamento|faturamento_mes_anterior|Variação|
----------+-----------+------------------------+--------+
2007-02-01|    8351.84|                        |%       |
2007-03-01|   23886.56|                 8351.84|186.00% |
2007-04-01|   28559.46|                23886.56|19.56%  |
2007-05-01|     514.18|                28559.46|-98.20% |