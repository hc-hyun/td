# 현재 칸의 방향 가이드가 유효하면 td.next를 강제 방향으로 설정합니다.
execute at @s if entity @e[type=minecraft:marker,tag=td.path.guide,distance=..0.45,scores={td.path_dir=1},limit=1] if block ~1 ~-1 ~ minecraft:black_wool run scoreboard players set @s td.next 1
execute if score @s td.next matches 0 at @s if entity @e[type=minecraft:marker,tag=td.path.guide,distance=..0.45,scores={td.path_dir=2},limit=1] if block ~-1 ~-1 ~ minecraft:black_wool run scoreboard players set @s td.next 2
execute if score @s td.next matches 0 at @s if entity @e[type=minecraft:marker,tag=td.path.guide,distance=..0.45,scores={td.path_dir=3},limit=1] if block ~ ~-1 ~1 minecraft:black_wool run scoreboard players set @s td.next 3
execute if score @s td.next matches 0 at @s if entity @e[type=minecraft:marker,tag=td.path.guide,distance=..0.45,scores={td.path_dir=4},limit=1] if block ~ ~-1 ~-1 minecraft:black_wool run scoreboard players set @s td.next 4
