# 활성 맵과 같은 map id를 가진 코어만 활성 코어로 표시합니다.
tag @e[type=minecraft:marker,tag=td.core.active] remove td.core.active
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] as @e[type=minecraft:marker,tag=td.core.point] if score @s td.map_id = @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] td.map_id run tag @s add td.core.active
