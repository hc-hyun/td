# Wave 18: boss x1 + fast x18.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"boss"}
execute if score $wave_time td.wave_time matches 80 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 110 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 140 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 170 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 200 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 230 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 260 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 290 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 320 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 350 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 380 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 410 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 440 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 470 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 500 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 530 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 560 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 590 run function td:spawn/random {type:"fast"}
execute if score $wave_time td.wave_time matches 720 run scoreboard players set $wave_done td.wave_done 1

