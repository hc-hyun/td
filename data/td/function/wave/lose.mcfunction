# 코어 HP가 0 이하가 되었을 때의 패배 처리입니다.
scoreboard players set $wave_state td.wave_state -1
scoreboard players set $wave_time td.wave_time 0
scoreboard players set $wave_done td.wave_done 0
scoreboard players set $wave_prep td.wave_prep 0
function td:reset/enemies
title @a title {text:'Defeat',color:'red',bold:true}
tellraw @a {text:'The core has fallen.',color:'red'}

