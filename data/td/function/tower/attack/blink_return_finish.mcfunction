# origin marker가 선택된 상태에서 실제 복귀를 처리합니다.
data modify entity @s immovable set value 0b
tp @s @e[type=minecraft:marker,tag=td.tower.return_origin,limit=1]

execute at @s run particle minecraft:portal ~ ~1 ~ 0.45 0.5 0.45 0.08 36 force
playsound minecraft:entity.enderman.teleport master @a[distance=..24] ~ ~ ~ 0.6 1.35

kill @e[type=minecraft:marker,tag=td.tower.return_origin,limit=1]
tag @s remove td.tower.blinking
data modify entity @s immovable set value 1b
