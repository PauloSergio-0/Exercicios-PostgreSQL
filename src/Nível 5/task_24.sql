create materialized view vm_queda_alugueis as --criando uma view materializada dos clientes com alugueis em queda
with
data_max as (
  select 
    max(r.rental_date) as max_data --data mais recente
  from rental r

),
periodos as (

  select 
    r.customer_id,
    r.rental_date,
    case 
      when r.rental_date >= d.max_data - interval '3 months' then 'ultimos_3' --pega a data do aluguel e compara com a data mais recente, se for maior ou igual a data mais recente - 3 meses, então é considerado aluguel dos ultimos 3 meses
      when r.rental_date >= d.max_data - interval '6 months' and r.rental_date < d.max_data - interval '3 months'  then '3_anteriores' --pega a data do aluguel e compara com a data mais recente, se for maior ou igual a data mais recente - 6 meses e menor que a data mais recente - 3 meses, então é considerado aluguel dos 3 meses anteriores
    end as periodo
  from rental r 
  cross join data_max d 

)SELECT
    p.customer_id as "ID",
    concat(c.first_name, ' ', c.last_name)as "Nome",

    COUNT(*) FILTER (WHERE p.periodo = 'ultimos_3') AS ultimos_3,--pega  a quantidade de aluguel dos ultimos 3 meses

    COUNT(*) FILTER (WHERE p.periodo = '3_anteriores') AS anteriores_3--pega a quantidade de aluguel dos 3 meses anteriores

FROM periodos p 
join customer c on c.customer_id = p.customer_id
WHERE periodo IS NOT NULL
GROUP BY p.customer_id, "Nome"
HAVING
    COUNT(*) FILTER (WHERE periodo = 'ultimos_3')
    <
    COUNT(*) FILTER (WHERE periodo = '3_anteriores') --trazer apenas os clientes que alugaram mais filmes nos 3 meses anteriores do que nos ultimos 3 meses
order by "Nome" asc;