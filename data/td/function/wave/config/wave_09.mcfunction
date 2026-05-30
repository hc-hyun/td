# Wave 09: basic x24, 12틱 간격.
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 32 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 44 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 56 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 68 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 80 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 92 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 104 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 116 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 128 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 140 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 152 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 164 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 176 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 188 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 200 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 212 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 224 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 236 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 248 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 260 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 272 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 284 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 296 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 360 run scoreboard players set $wave_done td.wave_done 1

