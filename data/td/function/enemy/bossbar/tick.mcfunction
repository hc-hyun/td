# 살아 있는 boss 타입 적들의 HP를 합산해 화면 상단 bossbar에 표시합니다.
scoreboard players set $boss_hp td.tmp 0
scoreboard players set $boss_max td.tmp 0

execute as @e[tag=td.enemy,tag=td.type.boss] run scoreboard players operation $boss_hp td.tmp += @s td.enemy_hp
execute as @e[tag=td.enemy,tag=td.type.boss] run scoreboard players operation $boss_max td.tmp += @s td.enemy_max_hp

execute unless score $boss_max td.tmp matches 1.. run bossbar set td:boss visible false
execute if score $boss_max td.tmp matches 1.. run bossbar set td:boss players @a
execute if score $boss_max td.tmp matches 1.. store result bossbar td:boss max run scoreboard players get $boss_max td.tmp
execute if score $boss_max td.tmp matches 1.. store result bossbar td:boss value run scoreboard players get $boss_hp td.tmp
execute if score $boss_max td.tmp matches 1.. run bossbar set td:boss visible true
