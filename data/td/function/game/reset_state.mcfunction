# 새 게임 시작이나 활성 맵 전환 때 전역 게임 상태를 대기 상태로 되돌립니다.
function td:reset/all
function td:economy/reset
scoreboard players operation $base td.hp = $core_hp td.hp
scoreboard players set $wave td.wave 0
scoreboard players set $wave_time td.wave_time 0
scoreboard players set $wave_state td.wave_state 0
scoreboard players set $wave_done td.wave_done 0
scoreboard players set $wave_prep td.wave_prep 0
