# blink 방어 유닛 설정입니다.
# 사거리 12, 도착 지점 주변 3블록, 공격 주기 100틱입니다.
tag @s add td.tower.blink
scoreboard players operation @s td.tower_cd = $tower_blink_initial_cd td.tower_cd
function td:tower/assign_id

team join td_tower @s
attribute @s minecraft:scale base set 1.05

item replace entity @s weapon.mainhand with minecraft:ender_pearl
item replace entity @s armor.head with minecraft:iron_helmet

particle minecraft:portal ~ ~1.1 ~ 0.45 0.6 0.45 0.08 28
playsound minecraft:entity.enderman.teleport master @a[distance=..24] ~ ~ ~ 0.5 1.5

tag @s remove td.tower.new
