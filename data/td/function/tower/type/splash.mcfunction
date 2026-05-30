# splash 방어 유닛 설정입니다.
# type 2, 사거리 7, 타겟 주변 2.5블록, 공격 주기 60틱입니다.
scoreboard players set @s td.tower_type 2
scoreboard players operation @s td.tower_cd = $tower_splash_initial_cd td.tower_cd
function td:tower/assign_id

team join td_tower @s
attribute @s minecraft:scale base set 0.95

item replace entity @s weapon.mainhand with minecraft:amethyst_shard
item replace entity @s armor.head with minecraft:golden_helmet

particle minecraft:enchant ~ ~1.1 ~ 0.45 0.6 0.45 0.15 24
playsound minecraft:entity.evoker.prepare_summon master @a[distance=..20] ~ ~ ~ 0.55 1.3

tag @s remove td.tower.new
