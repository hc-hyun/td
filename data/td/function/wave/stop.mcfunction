# 웨이브 진행을 대기 상태로 되돌리고 남아 있는 적을 정리합니다.
scoreboard players set $wave_state td.wave_state 0
scoreboard players set $wave_time td.wave_time 0
scoreboard players set $wave_done td.wave_done 0
scoreboard players set $wave_prep td.wave_prep 0
function td:reset/enemies
tellraw @a {text:'Wave stopped. Enemies cleared.',color:'gray'}

