# Wave 15: boss x1 + tank x4 + basic x12.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"boss"}
execute if score $wave_time td.wave_time matches 80 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 100 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 110 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 140 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 170 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 180 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 200 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 230 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 260 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 260 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 290 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 320 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 340 run function td:spawn/random {type:"tank"}
execute if score $wave_time td.wave_time matches 350 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 380 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 410 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 700 run scoreboard players set $wave_done td.wave_done 1

