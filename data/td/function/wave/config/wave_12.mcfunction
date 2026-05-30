# Wave 12: tank x8, 35틱 간격.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 55 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 90 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 125 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 160 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 195 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 230 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 265 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 420 run scoreboard players set $wave_done td.wave_done 1

