# 현재 $wave 번호의 웨이브를 시작합니다.
scoreboard players set $wave_state td.wave_state 1
scoreboard players set $wave_time td.wave_time 0
scoreboard players set $wave_done td.wave_done 0
scoreboard players set $wave_prep td.wave_prep 0
tellraw @a [{text:'Wave ',color:'gold'},{score:{name:'$wave',objective:'td.wave'},color:'yellow'},{text:' started.',color:'gold'}]

