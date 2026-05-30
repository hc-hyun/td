# 현재 map marker에 새 map id를 부여합니다.
scoreboard players add $next_map_id td.map_id 1
scoreboard players operation @s td.map_id = $next_map_id td.map_id
