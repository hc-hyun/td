# 웨이브 상태를 매 tick 갱신합니다.
# 상태값: 0 대기, 1 진행 중, 2 준비 시간, 3 승리, -1 패배.

# 코어 HP가 0 이하가 되면 즉시 패배 상태로 전환합니다.
execute unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 if score $base td.hp matches ..0 run function td:wave/lose

# 진행 중인 웨이브는 시간을 1틱 늘리고 현재 웨이브의 스폰표를 실행합니다.
execute if score $wave_state td.wave_state matches 1 run scoreboard players add $wave_time td.wave_time 1
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 1 run function td:wave/config/wave_01
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 2 run function td:wave/config/wave_02
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 3 run function td:wave/config/wave_03
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 4 run function td:wave/config/wave_04
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 5 run function td:wave/config/wave_05
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 6 run function td:wave/config/wave_06
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 7 run function td:wave/config/wave_07
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 8 run function td:wave/config/wave_08
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 9 run function td:wave/config/wave_09
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 10 run function td:wave/config/wave_10
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 11 run function td:wave/config/wave_11
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 12 run function td:wave/config/wave_12
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 13 run function td:wave/config/wave_13
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 14 run function td:wave/config/wave_14
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 15 run function td:wave/config/wave_15
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 16 run function td:wave/config/wave_16
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 17 run function td:wave/config/wave_17
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 18 run function td:wave/config/wave_18
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 19 run function td:wave/config/wave_19
execute if score $wave_state td.wave_state matches 1 if score $wave td.wave matches 20 run function td:wave/config/wave_20

# 스폰이 끝났고 남은 적이 없으면 현재 웨이브를 클리어합니다.
execute if score $wave_state td.wave_state matches 1 if score $wave_done td.wave_done matches 1 unless entity @e[tag=td.enemy] run function td:wave/complete

# 준비 시간은 30초에서 줄어들며, 0이 되면 다음 웨이브를 자동 시작합니다.
execute if score $wave_state td.wave_state matches 2 if score $wave_prep td.wave_prep matches 1.. run scoreboard players remove $wave_prep td.wave_prep 1
execute if score $wave_state td.wave_state matches 2 if score $wave_prep td.wave_prep matches ..0 run function td:wave/next

