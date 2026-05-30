# 활성 맵에 연결된 가까운 코어 marker만 삭제합니다.
tag @e[type=minecraft:marker,tag=td.core.remove] remove td.core.remove
function td:core/activate_for_map
execute unless entity @e[type=minecraft:marker,tag=td.core.active,distance=..8,sort=nearest,limit=1] run tellraw @s {text:'No active TD core within 8 blocks.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.core.active,distance=..8,sort=nearest,limit=1] as @e[type=minecraft:marker,tag=td.core.active,distance=..8,sort=nearest,limit=1] run tag @s add td.core.remove
execute at @e[type=minecraft:marker,tag=td.core.remove,limit=1] run particle minecraft:poof ~ ~1 ~ 0.25 0.35 0.25 0.02 10
execute if entity @e[type=minecraft:marker,tag=td.core.remove,limit=1] run tellraw @s {text:'TD core removed.',color:'yellow'}
kill @e[type=minecraft:marker,tag=td.core.remove]
function td:core/activate_for_map
