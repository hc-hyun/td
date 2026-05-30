# 0.5블록 간격으로 바라보는 방향을 훑어 처음 닿은 블록 위를 배치 후보로 삼습니다.
execute if score @s td.place_step matches 12.. run function td:place/fail/no_target

execute unless score @s td.place_step matches 12.. unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air run function td:place/raycast/hit
execute unless score @s td.place_step matches 12.. if block ~ ~ ~ minecraft:air run function td:place/raycast/continue
execute unless score @s td.place_step matches 12.. if block ~ ~ ~ minecraft:cave_air run function td:place/raycast/continue
execute unless score @s td.place_step matches 12.. if block ~ ~ ~ minecraft:void_air run function td:place/raycast/continue
