create table fato_aluguel(
  rental_id integer,
  customer_id integer,
  film_id integer,
  store_id integer,
  data date,
  valor numeric(10,2)
)

insert into fato_aluguel(
  select
    r.rental_id,
    c.customer_id,
    i.film_id,
    i.store_id,
    r.rental_date,
    p.amount
  from rental r
  join customer c on c.customer_id = r.customer_id
  join inventory i on i.inventory_id = r.inventory_id
  join payment p on p.rental_id = r.rental_id
  )

  create table dim_cliente as (
  select
    c.customer_id,
    c.first_name ||' '|| c.last_name as nome_cliente,
    c.active,
    ci.city,
    co.country
  FROM customer c
  JOIN address a ON c.address_id = a.address_id
  JOIN city ci ON a.city_id = ci.city_id
  JOIN country co ON ci.country_id = co.country_id
)

CREATE TABLE dim_filme AS
SELECT
    f.film_id,
    f.title,
    f.release_year,
    f.rental_rate,
    f.length,
    l.name AS idioma
FROM film f
JOIN language l ON f.language_id = l.language_id;