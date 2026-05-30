# $damage td.tmp에 들어 있는 피해량을 현재 적의 점수판 HP에서 뺍니다.
scoreboard players operation @s td.enemy_hp -= $damage td.tmp

particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.35 0.2 0 3

execute if score @s td.enemy_hp matches ..0 run function td:enemy/death
