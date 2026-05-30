# 새 저장 맵에 사용할 map id를 $saved_map_id에 준비합니다.
scoreboard players add $next_map_id td.map_id 1
scoreboard players operation $saved_map_id td.map_id = $next_map_id td.map_id
