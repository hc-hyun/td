# $requested_spawn_id와 같은 번호의 활성 스폰 지점을 선택합니다.
function td:spawn/select/clear
execute as @e[type=minecraft:marker,tag=td.spawn.active] if score @s td.spawn_id = $requested_spawn_id td.spawn_id run tag @s add td.spawn.selected
execute unless entity @e[type=minecraft:marker,tag=td.spawn.selected,limit=1] run tellraw @a {text:'No active TD spawn point with that id.',color:'red'}
