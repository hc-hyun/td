# blink 공격: 타겟에게 순간이동해 주변 3블록에 5 광역 피해를 준 뒤 잠시 후 원위치로 돌아옵니다.
scoreboard players set @s td.tower_cd 0

tag @e[tag=td.enemy,distance=..12,limit=1,sort=nearest] add td.tower.target
tag @s add td.tower.active_blink
tag @s add td.tower.blinking

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["td.tower.origin","td.tower.origin.new"]}
execute as @e[type=minecraft:marker,tag=td.tower.origin.new,sort=nearest,limit=1] run scoreboard players operation @s td.tower_id = @e[type=minecraft:mannequin,tag=td.tower.active_blink,limit=1] td.tower_id
tag @e[type=minecraft:marker,tag=td.tower.origin.new] remove td.tower.origin.new

data modify entity @s immovable set value 0b
scoreboard players set @s td.blink_time 6
tp @s @e[tag=td.tower.target,limit=1]
tp @s ~ ~ ~ facing entity @e[tag=td.tower.target,limit=1] eyes
swing @s mainhand

execute at @s run particle minecraft:portal ~ ~1 ~ 0.7 0.6 0.7 0.12 80 force
execute at @s run particle minecraft:sweep_attack ~ ~1.1 ~ 0.3 0.2 0.3 0 2 force
playsound minecraft:entity.enderman.teleport master @a[distance=..24] ~ ~ ~ 0.8 1.1

execute at @s run tag @e[tag=td.enemy,distance=..3] add td.tower.hit
scoreboard players set $damage td.tmp 5
function td:tower/damage/hit_tagged
