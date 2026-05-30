# 현재 blink 타워의 id와 같은 origin marker를 찾아 복귀합니다.
tag @s add td.tower.returning
tag @e[type=minecraft:marker,tag=td.tower.return_origin] remove td.tower.return_origin
execute as @e[type=minecraft:marker,tag=td.tower.origin] if score @s td.tower_id = @e[type=minecraft:mannequin,tag=td.tower.returning,limit=1] td.tower_id run tag @s add td.tower.return_origin

execute if entity @e[type=minecraft:marker,tag=td.tower.return_origin,limit=1] run function td:tower/attack/blink_return_finish

tag @s remove td.tower.returning
tag @e[type=minecraft:marker,tag=td.tower.return_origin] remove td.tower.return_origin
