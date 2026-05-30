# 활성 맵이 있을 때만 현재 위치를 스폰 지점으로 저장합니다.
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a[distance=..8] {text:'No active TD map. Use /function td:map/save_here or /function td:map/activate_nearest first.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run function td:spawnpoint/save_here_active
