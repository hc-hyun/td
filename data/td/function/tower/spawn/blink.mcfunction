# 현재 위치에 순간이동 광역 방어 유닛을 실제 소환합니다. 비용 차감은 호출자가 처리합니다.
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:mannequin ~ ~ ~ {Tags:["td.tower","td.tower.blink","td.tower.new"],immovable:1b,NoGravity:1b,Invulnerable:1b,hide_description:1b,pose:"standing",profile:{texture:"minecraft:entity/player/wide/steve",model:"wide"},Rotation:[180f,0f]}

scoreboard players set @e[type=minecraft:mannequin,tag=td.tower.new,tag=td.tower.blink,sort=nearest,limit=1] td.owner_id 0
scoreboard players set @e[type=minecraft:mannequin,tag=td.tower.new,tag=td.tower.blink,sort=nearest,limit=1] td.tower_cost 0
execute as @e[type=minecraft:mannequin,tag=td.tower.new,tag=td.tower.blink,sort=nearest,limit=1] run scoreboard players operation @s td.owner_id = @a[tag=td.place.actor,limit=1] td.player_id
execute as @e[type=minecraft:mannequin,tag=td.tower.new,tag=td.tower.blink,sort=nearest,limit=1] run scoreboard players operation @s td.tower_cost = @a[tag=td.place.actor,limit=1] td.place_cost
execute as @e[type=minecraft:mannequin,tag=td.tower.new,tag=td.tower.blink,sort=nearest,limit=1] at @s run function td:tower/type/blink
