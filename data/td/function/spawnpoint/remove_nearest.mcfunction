# 활성 맵에 연결된 가까운 스폰 지점만 삭제합니다.
tag @e[type=minecraft:marker,tag=td.spawn.remove] remove td.spawn.remove
execute unless entity @e[type=minecraft:marker,tag=td.spawn.active,distance=..8,sort=nearest,limit=1] run tellraw @a[distance=..8] {text:'No active TD spawn point within 8 blocks.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,distance=..8,sort=nearest,limit=1] as @e[type=minecraft:marker,tag=td.spawn.active,distance=..8,sort=nearest,limit=1] run tag @s add td.spawn.remove
execute at @e[type=minecraft:marker,tag=td.spawn.remove,limit=1] run particle minecraft:poof ~ ~1 ~ 0.25 0.35 0.25 0.02 10
execute if entity @e[type=minecraft:marker,tag=td.spawn.remove,limit=1] run tellraw @a[distance=..8] {text:'TD spawn point removed.',color:'yellow'}
kill @e[type=minecraft:marker,tag=td.spawn.remove]
function td:spawnpoint/activate_for_map
