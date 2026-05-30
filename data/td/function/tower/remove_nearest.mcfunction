# 플레이어 기준 4블록 안의 가장 가까운 방어 유닛을 제거합니다.
execute at @e[type=minecraft:mannequin,tag=td.tower,distance=..4,sort=nearest,limit=1] run particle minecraft:poof ~ ~1 ~ 0.3 0.4 0.3 0.02 12
execute at @e[type=minecraft:mannequin,tag=td.tower,distance=..4,sort=nearest,limit=1] run playsound minecraft:block.note_block.bass master @a[distance=..16] ~ ~ ~ 0.6 0.8
kill @e[type=minecraft:mannequin,tag=td.tower,distance=..4,sort=nearest,limit=1]
