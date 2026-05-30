# Wave 07: basic x12 + tank x3.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 45 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 70 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 95 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 120 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 120 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 145 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 170 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 195 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 220 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 240 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 245 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 270 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 295 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 360 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 480 run scoreboard players set $wave_done td.wave_done 1

