# 활성 맵이 있을 때만 새 웨이브 게임을 시작합니다.
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a {text:'No active TD map. Use /function td:map/save_here or /function td:map/activate_nearest first.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run function td:wave/start_active
