--o banco dvd rental já possui índices, então foi criado a view materializada "vm_queda_alugueis" para que possamos fazer os índices, ela esta na "task_24.sql"

--executando a view sem a criação dos index: 

explain analyze
select * from vm_queda_alugueis qa
where qa."ID" = 220

| QUERY PLAN                                                                                                     |
| -------------------------------------------------------------------------------------------------------------- |
| Seq Scan on vm_queda_alugueis qa  (cost=0.00..15.46 rows=1 width=31) (actual time=0.017..0.059 rows=1 loops=1) |
|   Filter: ("ID" = 220)                                                                                         |
|   Rows Removed by Filter: 596                                                                                  |
| Planning Time: 0.257 ms                                                                                        |
| Execution Time: 0.135 ms                                                                                       |


--index criado:

create index idx_customer_rental_period on vm_queda_alugueis("ID");

--Execução do mesmo comando:

explain analyze
select * from vm_queda_alugueis qa
where qa."ID" = 220

| QUERY PLAN                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Index Scan using idx_customer_rental_period on vm_queda_alugueis qa  (cost=0.28..2.49 rows=1 width=31) (actual time=0.041..0.041 rows=1 loops=1) |
|   Index Cond: ("ID" = 220)                                                                                                                       |
| Planning Time: 1.806 ms                                                                                                                          |
| Execution Time: 0.117 ms                                                                                                                         |

-- apesar da view ser pequena houve um ganho de 13.3% de velocidade que se fosse em um volume maior de dados seria ainda mais perceptivel.