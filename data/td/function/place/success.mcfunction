# 구매 비용을 차감하고 선택된 타입의 타워를 현재 위치에 소환합니다.
scoreboard players operation @s td.money -= @s td.place_cost

execute if score @s td.place_type matches 1 run function td:tower/spawn/basic
execute if score @s td.place_type matches 2 run function td:tower/spawn/splash
execute if score @s td.place_type matches 3 run function td:tower/spawn/blink

scoreboard players set @s td.place_cd 4
particle minecraft:happy_villager ~ ~1 ~ 0.25 0.35 0.25 0 8
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.6 1.5
title @s actionbar [{text:'Tower placed. Money ',color:'green'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
