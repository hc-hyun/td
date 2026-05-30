# 플레이어 4블록 안의 가장 가까운 방향 가이드를 제거합니다.
tag @e[type=minecraft:marker,tag=td.path.guide.remove] remove td.path.guide.remove
execute as @e[type=minecraft:marker,tag=td.path.guide,distance=..4,sort=nearest,limit=1] run tag @s add td.path.guide.remove

execute unless entity @e[type=minecraft:marker,tag=td.path.guide.remove,limit=1] run tellraw @s {text:'No path guide within 4 blocks.',color:'red'}
execute at @e[type=minecraft:marker,tag=td.path.guide.remove,limit=1] run particle minecraft:poof ~ ~1 ~ 0.25 0.35 0.25 0.02 10
execute if entity @e[type=minecraft:marker,tag=td.path.guide.remove,limit=1] run tellraw @s {text:'Path guide removed.',color:'yellow'}
kill @e[type=minecraft:marker,tag=td.path.guide.remove]
