# 저장 맵 시작점 중 map id가 없는 marker를 보정합니다.
execute as @e[type=minecraft:marker,tag=td.map.start] unless score @s td.map_id matches 1.. run function td:map/assign_id
