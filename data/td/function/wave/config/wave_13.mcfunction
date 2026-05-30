# Wave 13: basic x20 + fast x10.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 40 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 60 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 60 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 80 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 100 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 100 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 120 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 140 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 140 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 160 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 180 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 180 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 200 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 220 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 220 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 240 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 260 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 260 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 280 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 300 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 300 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 320 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 340 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 340 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 360 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 380 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 380 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 400 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 420 run function td:spawn/fast
execute if score $wave_time td.wave_time matches 540 run scoreboard players set $wave_done td.wave_done 1

