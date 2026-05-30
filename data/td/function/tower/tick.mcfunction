# 모든 방어 유닛의 공격 쿨타임을 진행합니다.
scoreboard players add @e[type=minecraft:mannequin,tag=td.tower] td.tower_cd 1

# 쿨타임이 찼고 사거리 안에 적이 있을 때만 공격합니다.
execute as @e[type=minecraft:mannequin,tag=td.tower,scores={td.tower_cd=40..}] at @s if entity @e[tag=td.enemy,distance=..8,limit=1,sort=nearest] run function td:tower/attack
