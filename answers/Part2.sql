"What is each pokemon's primary_type?"
select pokemons.name, pokemons.primary_type, types.name
from pokemons
inner join types
where pokemons.primary_type = types.id;

"What is Rufflet's secondary_type?"
select pokemons.name, pokemons.secondary_type, types.name
from pokemons
inner join types
where pokemons.name = "Rufflet" and types.id = pokemons.secondary_type;

"What are the names of the pokemon that belong to the trainer with trainerID 303?"
select pokemons.name, pokemons.id, pokemon_trainer.trainerID, pokemon_trainer.pokemon_id
from pokemons
inner join pokemon_trainer
where trainerID = '303' and pokemons.id = pokemon_trainer.pokemon_id;

"How many pokemon have a secondary_type Poison?" "Answer= 7"
select pokemons.name, pokemons.secondary_type, types.name
from pokemons
inner join types
where pokemons.secondary_type = types.id and types.name = "Poison";

"What are all the primary types and how many pokemon have that?"
select types.name, count(pokemons.primary_type) as Total
from pokemons
join types on types.id = pokemons.primary_type
group by types.name;

"How many pokemon at level 100 does each trainer with at least one level 100 pokemon have?" "Answer= 194"
select count(pokemon_id)
from pokemon_trainer
where pokelevel = 100
group by trainerID;

"How many pokemon only belong to one trainer and no other?"
select count(pokemon_id)
from pokemon_trainer
group by pokemon_id having count(pokemon_id)= 1;
