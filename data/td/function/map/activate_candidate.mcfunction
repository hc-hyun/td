# td.map.activate_candidate 태그가 붙은 저장 맵 시작점을 현재 활성 맵으로 전환합니다.
function td:map/ensure_ids
function td:game/reset_state

# 예전 단일 시작점 marker가 남아 있으면 새 구조와 섞이지 않도록 제거합니다.
kill @e[type=minecraft:marker,tag=td.start,tag=!td.map.start]

# 활성 맵은 항상 하나만 유지합니다.
tag @e[type=minecraft:marker,tag=td.map.active] remove td.map.active
tag @e[type=minecraft:marker,tag=td.start] remove td.start
tag @e[type=minecraft:marker,tag=td.map.activate_candidate,limit=1] add td.map.active
tag @e[type=minecraft:marker,tag=td.map.activate_candidate,limit=1] add td.start
function td:spawnpoint/activate_for_map

execute at @e[type=minecraft:marker,tag=td.map.activate_candidate,limit=1] run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.3 0.3 0.02 12
tag @e[type=minecraft:marker,tag=td.map.activate_candidate] remove td.map.activate_candidate
tellraw @a {text:'TD map activated. Game state reset.',color:'green'}
