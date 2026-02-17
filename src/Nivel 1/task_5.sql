--Qual funcionário realizou mais aluguéis?

select 
	s.staff_id as "ID",
	s.first_name  as "Nome",
	s.last_name as "Sobrenome",
	count(*) as Alugueis
from rental r 
join staff s on s.staff_id = r.staff_id 
group by s.staff_id, s.first_name, s.last_name 
order by Alugueis desc 
limit 1;
-- fiz um join para contar todos os alugueis que os funcinários fizeram depois eu agrupei 
--por nome de fuincionário e seus respectivos IDs pois pode ter mais de um fuincionário com o mesmo nome

ID|Nome|Sobrenome|alugueis|
--+----+---------+--------+
 1|Mike|Hillyer  |    8040|