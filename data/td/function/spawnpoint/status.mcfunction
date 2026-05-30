# 활성 맵의 스폰 지점 저장 상태를 표시합니다.
function td:spawnpoint/activate_for_map
scoreboard players set $active_spawn_count td.spawn_count 0
execute as @e[type=minecraft:marker,tag=td.spawn.active] run scoreboard players add $active_spawn_count td.spawn_count 1
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a {text:'Active TD map: none',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a [{text:'Active spawn points: ',color:'aqua'},{score:{name:'$active_spawn_count',objective:'td.spawn_count'},color:'yellow'},{text:'/8',color:'aqua'}]
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] if score $active_spawn_count td.spawn_count matches 0 run tellraw @a {text:'No spawn points saved. Enemy spawns fall back to the active map start.',color:'yellow'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=1},limit=1] run tellraw @a {text:'Spawn point 1: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=2},limit=1] run tellraw @a {text:'Spawn point 2: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=3},limit=1] run tellraw @a {text:'Spawn point 3: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=4},limit=1] run tellraw @a {text:'Spawn point 4: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=5},limit=1] run tellraw @a {text:'Spawn point 5: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=6},limit=1] run tellraw @a {text:'Spawn point 6: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=7},limit=1] run tellraw @a {text:'Spawn point 7: saved',color:'green'}
execute if entity @e[type=minecraft:marker,tag=td.spawn.active,scores={td.spawn_id=8},limit=1] run tellraw @a {text:'Spawn point 8: saved',color:'green'}
