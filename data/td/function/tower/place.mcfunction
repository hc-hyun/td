# 현재 플레이어 위치에 지정 타입 타워를 구매 배치합니다.
# 예: /function td:tower/place {type:"basic"}
execute unless score @s td.player_id matches 1.. run function td:player/assign_id
tag @a remove td.place.actor
tag @s add td.place.actor

function td:tower/select/clear
scoreboard players set @s td.place_cost 0
$function td:tower/select/$(type)

execute unless score @s td.money >= @s td.place_cost run function td:place/fail/no_money
execute if score @s td.money >= @s td.place_cost align xz positioned ~0.5 ~ ~0.5 run function td:place/attempt

function td:tower/select/clear
tag @s remove td.place.actor
