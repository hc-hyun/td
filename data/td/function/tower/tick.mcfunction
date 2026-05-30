# 모든 방어 유닛의 공격 쿨타임을 진행합니다.
scoreboard players add @e[type=minecraft:mannequin,tag=td.tower] td.tower_cd 1

# id가 빠진 타워에 고유 id를 부여합니다.
execute as @e[type=minecraft:mannequin,tag=td.tower] unless score @s td.tower_id matches 1.. run function td:tower/assign_id

# blink 타워는 타겟 위치에 잠시 머문 뒤 각자 원위치로 돌아옵니다.
scoreboard players remove @e[type=minecraft:mannequin,tag=td.tower.blinking,scores={td.blink_time=1..}] td.blink_time 1
execute as @e[type=minecraft:mannequin,tag=td.tower.blinking,scores={td.blink_time=..0}] at @s run function td:tower/attack/blink_return_one

# 타입별 쿨타임과 사거리 조건은 #td:tower/tick_types에 등록된 함수가 처리합니다.
function #td:tower/tick_types
