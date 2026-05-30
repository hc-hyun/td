# 활성 코어가 있을 때 코어 에너지를 화면 상단 bossbar로 표시합니다.
execute unless entity @e[type=minecraft:marker,tag=td.core.active,limit=1] run bossbar set td:core visible false
execute if score $wave_state td.wave_state matches -1 run bossbar set td:core visible false
execute if score $wave_state td.wave_state matches 3 run bossbar set td:core visible false

execute if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 run bossbar set td:core players @a
execute if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 store result bossbar td:core max run scoreboard players get $core_hp td.hp
execute if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 if score $base td.hp matches 1.. store result bossbar td:core value run scoreboard players get $base td.hp
execute if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 if score $base td.hp matches ..0 run bossbar set td:core value 0
execute if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 run bossbar set td:core visible true
