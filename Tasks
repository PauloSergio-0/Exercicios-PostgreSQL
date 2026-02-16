# 📊 Exercícios PostgreSQL --- Database dvdrental

Exercícios progressivos utilizando o banco de dados **dvdrental**, com
foco em:

-   Consultas SQL
-   JOINs e agregações
-   Subqueries e CTE
-   Window Functions
-   Performance e modelagem
-   Pensamento analítico para mercado

------------------------------------------------------------------------

## 🔹 Nível 1 --- Consultas Fundamentais

1.  Liste todos os filmes com:

    -   título\
    -   categoria\
    -   duração\
    -   valor de aluguel

2.  Quais são os 10 clientes que mais gastaram no total?

3.  Quantos filmes existem por categoria?\
    Ordene da maior para a menor.

4.  Quais filmes nunca foram alugados?

5.  Qual funcionário realizou mais aluguéis?

------------------------------------------------------------------------

## 🔹 Nível 2 --- JOINs e Agregações

6.  Para cada loja, mostre:

    -   total de clientes\
    -   total de aluguéis\
    -   total arrecadado

7.  Liste os atores que participaram de mais de 20 filmes.

8.  Qual foi o mês com maior faturamento?

9.  Para cada cliente, calcule:

    -   total de aluguéis\
    -   valor médio pago por aluguel

10. Liste os 5 filmes que mais geraram receita.

------------------------------------------------------------------------

## 🔹 Nível 3 --- Subqueries e CTE

11. Encontre os clientes que gastaram acima da média geral.

12. Para cada categoria, mostre o filme mais alugado.

13. Liste clientes que alugaram filmes de **todas as categorias**.

14. Calcule a taxa de retorno atrasado por cliente.

15. Mostre o ranking de clientes por valor gasto usando `ROW_NUMBER()`.

------------------------------------------------------------------------

## 🔹 Nível 4 --- Window Functions (Nível Analista)

16. Calcule o faturamento acumulado mês a mês.

17. Mostre a variação percentual de faturamento entre meses.

18. Dentro de cada categoria, ranqueie os filmes por receita.

19. Para cada cliente, mostre o intervalo médio entre aluguéis.

20. Identifique clientes com comportamento "em queda"\
    (menos aluguéis nos últimos 3 meses comparado aos 3 anteriores).

------------------------------------------------------------------------

## 🔹 Nível 5 --- Performance e Modelagem

21. Analise o plano de execução de uma query pesada usando:

``` sql
EXPLAIN ANALYZE
SELECT ...
```

O que pode ser otimizado?

22. Crie índices estratégicos para melhorar:

-   consultas por `customer_id`
-   consultas por `rental_date`
-   agregações por `film_id`

Exemplo:

``` sql
CREATE INDEX idx_rental_customer ON rental(customer_id);
CREATE INDEX idx_rental_date ON rental(rental_date);
CREATE INDEX idx_inventory_film ON inventory(film_id);
```

23. Crie uma view chamada:

``` sql
CREATE VIEW vw_faturamento_mensal AS
SELECT
    DATE_TRUNC('month', payment_date) AS mes,
    SUM(amount) AS receita
FROM payment
GROUP BY 1
ORDER BY 1;
```

24. Crie uma materialized view para os filmes mais alugados:

``` sql
CREATE MATERIALIZED VIEW mv_filmes_mais_alugados AS
SELECT
    f.title,
    COUNT(r.rental_id) AS total_alugueis
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_alugueis DESC;
```

25. Modele um mini Data Warehouse:

-   **Fato_aluguel**
    -   rental_id
    -   customer_id
    -   film_id
    -   store_id
    -   data
    -   valor
-   **Dim_cliente**
-   **Dim_filme**
-   **Dim_loja**
-   **Dim_tempo**

------------------------------------------------------------------------

## 🔹 Desafio Final --- Nível Mercado

Crie um relatório SQL único que retorne:

-   Loja\
-   Mês\
-   Receita\
-   Quantidade de clientes ativos\
-   Ticket médio\
-   Crescimento percentual em relação ao mês anterior

Regras:

-   Utilizar `JOIN`
-   Utilizar `CTE`
-   Utilizar `WINDOW FUNCTIONS`
-   Não utilizar ferramentas externas

------------------------------------------------------------------------

## 🎯 Objetivo

Simular cenários reais de:

-   Entrevistas técnicas
-   Projetos de portfólio
-   Testes práticos para vagas de Data Analyst
-   Testes práticos para Data Engineer
-   Avaliações para Backend com PostgreSQL
