# 모든 방어 유닛의 공격 쿨타임을 진행합니다.
scoreboard players add @e[type=minecraft:mannequin,tag=td.tower] td.tower_cd 1

# 새 구조 이전에 배치된 타워나 id가 빠진 타워에 고유 id를 부여합니다.
execute as @e[type=minecraft:mannequin,tag=td.tower] unless score @s td.tower_id matches 1.. run function td:tower/assign_id

# blink 타워는 타겟 위치에 잠시 머문 뒤 각자 원위치로 돌아옵니다.
scoreboard players remove @e[type=minecraft:mannequin,tag=td.tower.blinking,scores={td.blink_time=1..}] td.blink_time 1
execute as @e[type=minecraft:mannequin,tag=td.tower.blinking,scores={td.blink_time=..0}] at @s run function td:tower/attack/blink_return_one

# 이전 버전에서 이미 배치된 basic 타워는 새 타입 점수가 없을 수 있으므로 보정합니다.
execute as @e[type=minecraft:mannequin,tag=td.tower.basic] unless score @s td.tower_type matches 1.. run scoreboard players set @s td.tower_type 1

# 타입별 쿨타임과 사거리 조건을 만족할 때만 공통 공격 디스패처로 보냅니다.
execute as @e[type=minecraft:mannequin,tag=td.tower,tag=!td.tower.blinking,scores={td.tower_cd=40..}] at @s if score @s td.tower_type matches 1 if entity @e[tag=td.enemy,distance=..8,limit=1,sort=nearest] run function td:tower/attack
execute as @e[type=minecraft:mannequin,tag=td.tower,tag=!td.tower.blinking,scores={td.tower_cd=60..}] at @s if score @s td.tower_type matches 2 if entity @e[tag=td.enemy,distance=..7,limit=1,sort=nearest] run function td:tower/attack
execute as @e[type=minecraft:mannequin,tag=td.tower,tag=!td.tower.blinking,scores={td.tower_cd=100..}] at @s if score @s td.tower_type matches 3 if entity @e[tag=td.enemy,distance=..12,limit=1,sort=nearest] run function td:tower/attack
