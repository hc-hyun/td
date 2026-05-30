# 현재 위치의 X/Z 중앙에 방향 가이드를 저장합니다.
execute align xz positioned ~0.5 ~ ~0.5 run kill @e[type=minecraft:marker,tag=td.path.guide,distance=..0.6]
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["td.path.guide","td.path.guide.new"]}
execute as @e[type=minecraft:marker,tag=td.path.guide.new,sort=nearest,limit=1] run scoreboard players operation @s td.path_dir = @a[tag=td.path.guide.actor,limit=1] td.path_dir
tag @e[type=minecraft:marker,tag=td.path.guide.new] remove td.path.guide.new

execute align xz positioned ~0.5 ~ ~0.5 run particle minecraft:happy_villager ~ ~1 ~ 0.25 0.35 0.25 0 8
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.6 1.4
