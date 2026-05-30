# 현재 위치의 X/Z 칸 중앙에 저장 맵 시작점을 만들고 즉시 활성화합니다.
# 같은 위치 근처의 기존 map marker는 교체하되, 같은 맵 id를 유지합니다.
function td:map/ensure_ids
tag @e[type=minecraft:marker,tag=td.map.activate_candidate] remove td.map.activate_candidate
tag @e[type=minecraft:marker,tag=td.map.reuse] remove td.map.reuse
scoreboard players set $saved_map_id td.map_id 0
execute align xz positioned ~0.5 ~ ~0.5 as @e[type=minecraft:marker,tag=td.map.start,distance=..1,sort=nearest,limit=1] run tag @s add td.map.reuse
execute if entity @e[type=minecraft:marker,tag=td.map.reuse,limit=1] run scoreboard players operation $saved_map_id td.map_id = @e[type=minecraft:marker,tag=td.map.reuse,limit=1] td.map_id
execute unless entity @e[type=minecraft:marker,tag=td.map.reuse,limit=1] run function td:map/next_id
execute align xz positioned ~0.5 ~ ~0.5 run kill @e[type=minecraft:marker,tag=td.map.start,distance=..1]
execute align xz positioned ~0.5 ~ ~0.5 run kill @e[type=minecraft:marker,tag=td.start,tag=!td.map.start,distance=..1]
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["td.map.start","td.map.activate_candidate"]}
execute as @e[type=minecraft:marker,tag=td.map.activate_candidate,limit=1] run scoreboard players operation @s td.map_id = $saved_map_id td.map_id
tellraw @a[distance=..8] {text:'TD map start saved.',color:'green'}
tag @e[type=minecraft:marker,tag=td.map.reuse] remove td.map.reuse
function td:map/activate_candidate
