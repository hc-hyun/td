# 현재 실행 위치에 타워를 놓을 수 있는지 검사한 뒤 성공/실패를 처리합니다.
tag @s add td.place.valid
tag @s remove td.place.open

execute if block ~ ~ ~ minecraft:air run tag @s add td.place.open
execute if block ~ ~ ~ minecraft:cave_air run tag @s add td.place.open
execute if block ~ ~ ~ minecraft:void_air run tag @s add td.place.open

execute unless entity @s[tag=td.place.open] run tag @s remove td.place.valid
execute if block ~ ~-1 ~ minecraft:black_wool run tag @s remove td.place.valid
execute if entity @e[type=minecraft:mannequin,tag=td.tower,distance=..1] run tag @s remove td.place.valid
execute unless score @s td.money >= @s td.place_cost run tag @s remove td.place.valid
execute unless score @s td.place_type matches 1..3 run tag @s remove td.place.valid

execute if entity @s[tag=td.place.valid] run function td:place/success
execute unless entity @s[tag=td.place.valid] run function td:place/fail/invalid

tag @s remove td.place.valid
tag @s remove td.place.open
