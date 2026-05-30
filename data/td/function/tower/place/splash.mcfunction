# 플레이어 위치에 광역 마법 방어 유닛을 구매 배치합니다.
execute unless score @s td.player_id matches 1.. run function td:player/assign_id
tag @a remove td.place.actor
tag @s add td.place.actor

scoreboard players set @s td.place_type 2
scoreboard players set @s td.place_cost 40
execute unless score @s td.money >= @s td.place_cost run function td:place/fail/no_money
execute if score @s td.money >= @s td.place_cost align xz positioned ~0.5 ~ ~0.5 run function td:place/attempt

tag @s remove td.place.actor
