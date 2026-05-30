# Wave 01: basic x6, 30틱 간격.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 50 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 80 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 110 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 140 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 170 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 220 run scoreboard players set $wave_done td.wave_done 1

