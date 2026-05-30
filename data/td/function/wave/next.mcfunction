# 준비 시간을 건너뛰고 다음 웨이브를 시작합니다.
execute if score $wave_state td.wave_state matches 2 if score $wave td.wave matches ..19 run scoreboard players add $wave td.wave 1
execute if score $wave_state td.wave_state matches 2 if score $wave td.wave matches 1..20 run function td:wave/begin

