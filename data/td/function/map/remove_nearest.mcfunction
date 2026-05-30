# 플레이어 8블록 안의 가장 가까운 저장 맵 시작점을 삭제합니다.
tag @e[type=minecraft:marker,tag=td.map.remove] remove td.map.remove
execute unless entity @e[type=minecraft:marker,tag=td.map.start,distance=..8,sort=nearest,limit=1] run tellraw @a[distance=..8] {text:'No saved TD map start within 8 blocks.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.start,distance=..8,sort=nearest,limit=1] as @e[type=minecraft:marker,tag=td.map.start,distance=..8,sort=nearest,limit=1] run tag @s add td.map.remove

# 활성 맵을 삭제한다면 진행 중인 게임도 멈춥니다.
execute if entity @e[type=minecraft:marker,tag=td.map.remove,tag=td.map.active,limit=1] run function td:game/reset_state
execute at @e[type=minecraft:marker,tag=td.map.remove,limit=1] run particle minecraft:poof ~ ~1 ~ 0.3 0.3 0.3 0.02 12
execute if entity @e[type=minecraft:marker,tag=td.map.remove,limit=1] run tellraw @a[distance=..8] {text:'TD map start removed.',color:'yellow'}
kill @e[type=minecraft:marker,tag=td.map.remove]
