select 
	f.title as Titulo,
	f.film_id  as "ID" 
from film f
where true 
and f.film_id not exists ( 
--uso um filtro para verificar os film_id que não estão na tabela inventory mas antes disso
--faço um join com a tabela rental para trazer todos os alugueis
	select
		iv.film_id
	from inventory iv 
	join rental r2 on iv.inventory_id = r2.inventory_id

)
order by f.film_id asc; -- ordenei os ids para facilitar verificação de IDs


title                 |film_id|
----------------------+-------+
Alice Fantasia        |     14|
Apollo Teen           |     33|
Argonauts Town        |     36|
Ark Ridgemont         |     38|
Arsenic Independence  |     41|
Boondock Ballroom     |     87|
Butch Panther         |    108|
Catch Amistad         |    128|
Chinatown Gladiator   |    144|
Chocolate Duck        |    148|
Commandments Express  |    171|
Crossing Divorce      |    192|
Crowds Telemark       |    195|
Crystal Breaking      |    198|
Dazed Punk            |    217|
Deliverance Mulholland|    221|
Firehouse Vietnam     |    318|
Floats Garden         |    325|
Frankenstein Stranger |    332|
Gladiator Westward    |    359|
Gump Date             |    386|
Hate Handicap         |    404|
Hocus Frida           |    419|
Kentuckian Giant      |    495|
Kill Brotherhood      |    497|
Muppet Mile           |    607|
Order Betrayed        |    642|
Pearl Destiny         |    669|
Perdition Fargo       |    671|
Psycho Shrunk         |    701|
Raiders Antitrust     |    712|
Rainbow Shock         |    713|
Roof Champion         |    742|
Sister Freddy         |    801|
Sky Miracle           |    802|
Suicides Silence      |    860|
Tadpole Park          |    874|
Treasure Command      |    909|
Villain Desperate     |    943|
Volume House          |    950|
Wake Jaws             |    954|
Walls Artist          |    955|