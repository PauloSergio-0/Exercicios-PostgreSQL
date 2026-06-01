EXPLAIN ANALYZE
with
receita_filmes as (
  select
    f.film_id,
    f.title,
    sum(p.amount) as "Receita"
  from film f
  join inventory i on i.film_id = f.film_id
  join rental r on r.inventory_id = i.inventory_id
  join payment p on p.rental_id = r.rental_id
  group by f.film_id, f.title
)
select 
  c.name as "Categoria",
  rf.film_id as "ID FIlme",
  rf.title as "Título",
  rf."Receita",
  row_number() over (partition by c.category_id order by rf."Receita" desc) as "Ranking receita"
from category c
join film_category fc on fc.category_id = c.category_id
join receita_filmes rf on rf.film_id = fc.film_id
order by c.name asc

RESULTADO:
| QUERY PLAN                                                                                                                                                              |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Sort  (cost=1370.74..1373.24 rows=1000 width=131) (actual time=115.382..115.442 rows=958 loops=1)                                                                       |
|   Sort Key: c.name                                                                                                                                                      |
|   Sort Method: quicksort  Memory: 90kB                                                                                                                                  |
|   ->  WindowAgg  (cost=1300.93..1320.91 rows=1000 width=131) (actual time=114.575..114.994 rows=958 loops=1)                                                            |
|         ->  Sort  (cost=1300.91..1303.41 rows=1000 width=123) (actual time=114.564..114.636 rows=958 loops=1)                                                           |
|               Sort Key: c.category_id, (sum(p.amount)) DESC                                                                                                             |
|               Sort Method: quicksort  Memory: 80kB                                                                                                                      |
|               ->  Hash Join  (cost=1221.52..1251.08 rows=1000 width=123) (actual time=113.029..113.855 rows=958 loops=1)                                                |
|                     Hash Cond: (fc.category_id = c.category_id)                                                                                                         |
|                     ->  Hash Join  (cost=1220.16..1246.41 rows=1000 width=53) (actual time=111.955..112.589 rows=958 loops=1)                                           |
|                           Hash Cond: (f.film_id = fc.film_id)                                                                                                           |
|                           ->  HashAggregate  (cost=1191.66..1204.16 rows=1000 width=51) (actual time=107.478..107.845 rows=958 loops=1)                                 |
|                                 Group Key: f.film_id                                                                                                                    |
|                                 Batches: 1  Memory Usage: 449kB                                                                                                         |
|                                 ->  Hash Join  (cost=749.56..1118.68 rows=14596 width=25) (actual time=72.743..103.057 rows=14596 loops=1)                              |
|                                       Hash Cond: (i.film_id = f.film_id)                                                                                                |
|                                       ->  Hash Join  (cost=639.06..969.70 rows=14596 width=8) (actual time=44.153..71.031 rows=14596 loops=1)                           |
|                                             Hash Cond: (r.inventory_id = i.inventory_id)                                                                                |
|                                             ->  Hash Join  (cost=510.99..803.28 rows=14596 width=10) (actual time=31.668..54.580 rows=14596 loops=1)                    |
|                                                   Hash Cond: (p.rental_id = r.rental_id)                                                                                |
|                                                   ->  Seq Scan on payment p  (cost=0.00..253.96 rows=14596 width=10) (actual time=0.380..10.786 rows=14596 loops=1)     |
|                                                   ->  Hash  (cost=310.44..310.44 rows=16044 width=8) (actual time=31.210..31.211 rows=16044 loops=1)                    |
|                                                         Buckets: 16384  Batches: 1  Memory Usage: 755kB                                                                 |
|                                                         ->  Seq Scan on rental r  (cost=0.00..310.44 rows=16044 width=8) (actual time=0.792..28.106 rows=16044 loops=1) |
|                                             ->  Hash  (cost=70.81..70.81 rows=4581 width=6) (actual time=12.448..12.449 rows=4581 loops=1)                              |
|                                                   Buckets: 8192  Batches: 1  Memory Usage: 243kB                                                                        |
|                                                   ->  Seq Scan on inventory i  (cost=0.00..70.81 rows=4581 width=6) (actual time=0.652..11.589 rows=4581 loops=1)       |
|                                       ->  Hash  (cost=98.00..98.00 rows=1000 width=19) (actual time=28.573..28.573 rows=1000 loops=1)                                   |
|                                             Buckets: 1024  Batches: 1  Memory Usage: 59kB                                                                               |
|                                             ->  Seq Scan on film f  (cost=0.00..98.00 rows=1000 width=19) (actual time=0.015..28.277 rows=1000 loops=1)                 |
|                           ->  Hash  (cost=16.00..16.00 rows=1000 width=4) (actual time=4.460..4.460 rows=1000 loops=1)                                                  |
|                                 Buckets: 1024  Batches: 1  Memory Usage: 44kB                                                                                           |
|                                 ->  Seq Scan on film_category fc  (cost=0.00..16.00 rows=1000 width=4) (actual time=0.718..4.288 rows=1000 loops=1)                     |
|                     ->  Hash  (cost=1.16..1.16 rows=16 width=72) (actual time=1.063..1.063 rows=16 loops=1)                                                             |
|                           Buckets: 1024  Batches: 1  Memory Usage: 9kB                                                                                                  |
|                           ->  Seq Scan on category c  (cost=0.00..1.16 rows=16 width=72) (actual time=1.047..1.050 rows=16 loops=1)                                     |
| Planning Time: 21.004 ms                                                                                                                                                |
| Execution Time: 115.914 ms                                                                                                                                              |