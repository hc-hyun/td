# 활성 맵과 활성 코어가 있을 때만 새 웨이브 게임을 시작합니다.
function td:core/activate_for_map
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a {text:'No active TD map. Use /function td:map/save_here or /function td:map/activate_nearest first.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] unless entity @e[type=minecraft:marker,tag=td.core.active,limit=1] run tellraw @a {text:'No active TD core. Stand on the core block and use /function td:core/save_here first.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] run function td:wave/start_active
