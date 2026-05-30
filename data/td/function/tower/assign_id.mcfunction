# 방어 유닛마다 복귀 marker와 짝지을 고유 id를 부여합니다.
scoreboard players add $next_tower_id td.tower_id 1
scoreboard players operation @s td.tower_id = $next_tower_id td.tower_id
