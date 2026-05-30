# 플레이어 위치에 기본 방어 유닛을 구매 배치합니다.
execute unless score @s td.player_id matches 1.. run function td:player/assign_id
tag @a remove td.place.actor
tag @s add td.place.actor

scoreboard players set @s td.place_type 1
scoreboard players operation @s td.place_cost = $tower_basic_cost td.place_cost
execute unless score @s td.money >= @s td.place_cost run function td:place/fail/no_money
execute if score @s td.money >= @s td.place_cost align xz positioned ~0.5 ~ ~0.5 run function td:place/attempt

tag @s remove td.place.actor
