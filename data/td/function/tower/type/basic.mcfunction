# basic 방어 유닛 설정입니다.
# type 1, 피해 4, 사거리 8, 공격 주기 40틱입니다.
scoreboard players set @s td.tower_type 1
scoreboard players set @s td.tower_cd 40
function td:tower/assign_id

team join td_tower @s
attribute @s minecraft:scale base set 1.0

item replace entity @s weapon.mainhand with minecraft:iron_sword
item replace entity @s armor.head with minecraft:leather_helmet

particle minecraft:happy_villager ~ ~1 ~ 0.3 0.4 0.3 0 8
playsound minecraft:block.note_block.pling master @a[distance=..16] ~ ~ ~ 0.6 1.4

tag @s remove td.tower.new
