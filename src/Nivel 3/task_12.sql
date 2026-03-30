with
contagem_filmes as (
	select
		i.film_id,
		count(*) as contagem_aluguel
	from inventory i
	group by i.film_id
),
ranking as (
	select
		c.category_id,
		c.name,
		f.film_id,
		f.title,
		cf.contagem_aluguel,
		row_number() over(
			Partition by c.category_id order by cf.contagem_aluguel desc
			) as rn -- ordem crescente de contagem de filmes por cartegoria
	from category c
		join film_category fc on fc.category_id = c.category_id
		join film f on f.film_id = fc.film_id
		join contagem_filmes cf on cf.film_id = fc.film_id
) SELECT
    category_id as "ID categoria",
    name as "Categoria",
    film_id as "ID filme",
    title as "Filme",
    contagem_aluguel as "Total de alugueis"
FROM ranking
	WHERE rn = 1;

| ID categoria | Categoria   | ID filme | Filme                  | Total de alugueis |
| ------------ | ----------- | -------- | ---------------------- | ----------------- |
| 1            | Action      | 586      | Mockingbird Hollywood  | 8                 |
| 2            | Animation   | 489      | Juggler Hardly         | 8                 |
| 3            | Children    | 873      | Sweethearts Suspects   | 8                 |
| 4            | Classics    | 341      | Frost Head             | 8                 |
| 5            | Comedy      | 444      | Hustler Party          | 8                 |
| 6            | Documentary | 295      | Expendable Stallion    | 8                 |
| 7            | Drama       | 683      | Pity Bound             | 8                 |
| 8            | Family      | 753      | Rush Goodfellas        | 8                 |
| 9            | Foreign     | 500      | Kiss Glory             | 8                 |
| 10           | Games       | 331      | Forward Temple         | 8                 |
| 11           | Horror      | 702      | Pulp Beverly           | 8                 |
| 12           | Music       | 174      | Confidential Interview | 8                 |
| 13           | New         | 109      | Butterfly Chocolat     | 8                 |
| 14           | Sci-Fi      | 350      | Garden Island          | 8                 |
| 15           | Sports      | 361      | Gleaming Jawbreaker    | 8                 |
| 16           | Travel      | 434      | Horror Reign           | 8                 |