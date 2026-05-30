# 현재 활성 맵에 $requested_spawn_id 번호의 스폰 지점을 저장합니다.
function td:map/ensure_ids
tag @e[type=minecraft:marker,tag=td.spawn.replace] remove td.spawn.replace
execute as @e[type=minecraft:marker,tag=td.spawn.point] if score @s td.map_id = @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] td.map_id if score @s td.spawn_id = $requested_spawn_id td.spawn_id run tag @s add td.spawn.replace
kill @e[type=minecraft:marker,tag=td.spawn.replace]

execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["td.spawn.point","td.spawn.active","td.spawn.new"]}
execute as @e[type=minecraft:marker,tag=td.spawn.new,limit=1] run scoreboard players operation @s td.map_id = @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] td.map_id
execute as @e[type=minecraft:marker,tag=td.spawn.new,limit=1] run scoreboard players operation @s td.spawn_id = $requested_spawn_id td.spawn_id
execute at @e[type=minecraft:marker,tag=td.spawn.new,limit=1] run particle minecraft:happy_villager ~ ~1 ~ 0.25 0.35 0.25 0.02 10
tellraw @a[distance=..8] [{text:'TD spawn point '},{score:{name:'$requested_spawn_id',objective:'td.spawn_id'},color:'yellow'},{text:' saved for active map.',color:'green'}]
tag @e[type=minecraft:marker,tag=td.spawn.new] remove td.spawn.new
function td:spawnpoint/activate_for_map
