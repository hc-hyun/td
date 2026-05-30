# 현재 활성 맵의 기존 코어를 교체하고 새 코어 marker를 저장합니다.
tag @e[type=minecraft:marker,tag=td.core.replace] remove td.core.replace
execute as @e[type=minecraft:marker,tag=td.core.point] if score @s td.map_id = @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] td.map_id run tag @s add td.core.replace
kill @e[type=minecraft:marker,tag=td.core.replace]

# 발밑 블록의 중앙에 marker를 둡니다.
execute align xz positioned ~0.5 ~-0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["td.core.point","td.core.active","td.core.new"]}
execute as @e[type=minecraft:marker,tag=td.core.new,limit=1] run scoreboard players operation @s td.map_id = @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] td.map_id
execute at @e[type=minecraft:marker,tag=td.core.new,limit=1] run particle minecraft:heart ~ ~1 ~ 0.25 0.35 0.25 0.02 12
tellraw @s {text:'TD core saved for active map.',color:'green'}
tag @e[type=minecraft:marker,tag=td.core.new] remove td.core.new
function td:core/activate_for_map
