# 현재 적의 점수판 HP를 10칸 체력바 단계로 변환합니다.
scoreboard players operation @s td.hp_ratio = @s td.enemy_hp
scoreboard players operation @s td.hp_ratio *= $hp_scale td.tmp
execute if score @s td.enemy_max_hp matches 1.. run scoreboard players operation @s td.hp_ratio /= @s td.enemy_max_hp

# 살아 있는 적은 최소 1칸, 과치유나 보정값은 최대 10칸으로 고정합니다.
execute if score @s td.enemy_hp matches 1.. if score @s td.hp_ratio matches ..0 run scoreboard players set @s td.hp_ratio 1
execute if score @s td.hp_ratio matches 11.. run scoreboard players set @s td.hp_ratio 10

tag @s remove td.hpbar.matched
function #td:enemy/hpbar_types
execute unless entity @s[tag=td.hpbar.matched] run function td:enemy/hpbar/type/basic
tag @s remove td.hpbar.matched

tag @s add td.hpbar.ready
