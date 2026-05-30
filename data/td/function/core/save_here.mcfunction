# 플레이어 발밑 블록 중앙을 활성 맵의 코어로 저장합니다.
function td:map/ensure_ids
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @s {text:'No active TD map. Use /function td:map/save_here or /function td:map/activate_nearest first.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run function td:core/save_here_active
