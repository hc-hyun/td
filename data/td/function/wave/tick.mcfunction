# 웨이브 상태를 매 tick 갱신합니다.
# 상태값: 0 대기, 1 진행 중, 2 준비 시간, 3 승리, -1 패배.

# 코어 HP가 0 이하가 되면 즉시 패배 상태로 전환합니다.
execute unless score $wave_state td.wave_state matches -1 unless score $wave_state td.wave_state matches 3 if score $base td.hp matches ..0 run function td:wave/lose

# 진행 중인 웨이브는 시간을 1틱 늘리고 현재 웨이브의 스폰표를 실행합니다.
execute if score $wave_state td.wave_state matches 1 run scoreboard players add $wave_time td.wave_time 1
execute if score $wave_state td.wave_state matches 1 run function td:wave/run_config

# 스폰이 끝났고 남은 적이 없으면 현재 웨이브를 클리어합니다.
execute if score $wave_state td.wave_state matches 1 if score $wave_done td.wave_done matches 1 unless entity @e[tag=td.enemy] run function td:wave/complete

# 준비 시간은 30초에서 줄어들며, 0이 되면 다음 웨이브를 자동 시작합니다.
execute if score $wave_state td.wave_state matches 2 if score $wave_prep td.wave_prep matches 1.. run scoreboard players remove $wave_prep td.wave_prep 1
execute if score $wave_state td.wave_state matches 2 if score $wave_prep td.wave_prep matches ..0 run function td:wave/next
