# 기본 방어 유닛은 기존 적 HP 점수판을 4 깎습니다.
scoreboard players remove @s td.enemy_hp 4

particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.35 0.2 0 3

execute if score @s td.enemy_hp matches ..0 run function td:enemy/death
