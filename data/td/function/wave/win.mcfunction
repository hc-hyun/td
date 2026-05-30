# 20웨이브를 모두 막아냈을 때의 승리 처리입니다.
scoreboard players set $wave_state td.wave_state 3
scoreboard players set $wave_time td.wave_time 0
scoreboard players set $wave_done td.wave_done 1
scoreboard players set $wave_prep td.wave_prep 0
function td:reset/enemies
title @a title {text:'Victory!',color:'green',bold:true}
tellraw @a {text:'All 20 waves cleared. The core survived.',color:'green'}

