# 플레이어 8블록 안의 가장 가까운 저장 맵 시작점을 활성화합니다.
tag @e[type=minecraft:marker,tag=td.map.activate_candidate] remove td.map.activate_candidate
execute unless entity @e[type=minecraft:marker,tag=td.map.start,distance=..8,sort=nearest,limit=1] run tellraw @a[distance=..8] {text:'No saved TD map start within 8 blocks.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.start,distance=..8,sort=nearest,limit=1] as @e[type=minecraft:marker,tag=td.map.start,distance=..8,sort=nearest,limit=1] run tag @s add td.map.activate_candidate
execute if entity @e[type=minecraft:marker,tag=td.map.activate_candidate,limit=1] run function td:map/activate_candidate
