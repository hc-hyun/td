# 구매 비용을 차감하고 선택된 타입의 타워를 현재 위치에 소환합니다.
scoreboard players operation @s td.money -= @s td.place_cost

function #td:tower/place_types

scoreboard players set @s td.place_cd 4
particle minecraft:happy_villager ~ ~1 ~ 0.25 0.35 0.25 0 8
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.6 1.5
function td:hud/notify/placed
