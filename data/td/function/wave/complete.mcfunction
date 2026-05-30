# 현재 웨이브의 모든 스폰과 적 처리가 끝났을 때 호출됩니다.
execute if score $wave td.wave matches 20 run function td:wave/win

# 20웨이브 전까지는 방어 유닛을 유지한 채 30초 준비 시간을 줍니다.
execute unless score $wave td.wave matches 20 run scoreboard players set $wave_state td.wave_state 2
execute unless score $wave td.wave matches 20 run scoreboard players set $wave_time td.wave_time 0
execute unless score $wave td.wave matches 20 run scoreboard players set $wave_done td.wave_done 0
execute unless score $wave td.wave matches 20 run scoreboard players set $wave_prep td.wave_prep 600
execute unless score $wave td.wave matches 20 run tellraw @a [{text:'Wave ',color:'green'},{score:{name:'$wave',objective:'td.wave'},color:'yellow'},{text:' cleared. Next wave in 30 seconds.',color:'green'}]

