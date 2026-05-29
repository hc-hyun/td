# normal 속도 이동입니다.
# 한 틱에 0.1블록씩 이동하고, 10틱이 지나면 정확히 1블록을 이동합니다.
# tp 마지막의 yaw/pitch 값으로 적이 이동 방향을 바라보게 합니다.
# Minecraft yaw 기준: 동쪽 -90, 서쪽 90, 남쪽 0, 북쪽 180입니다.
execute if score @s td.dir matches 1 run tp @s ~0.1 ~ ~ -90 0
execute if score @s td.dir matches 2 run tp @s ~-0.1 ~ ~ 90 0
execute if score @s td.dir matches 3 run tp @s ~ ~ ~0.1 0 0
execute if score @s td.dir matches 4 run tp @s ~ ~ ~-0.1 180 0

# 현재 블록 안에서 이동한 틱 수를 1 증가시킵니다.
scoreboard players add @s td.step 1

# 10틱 이상 이동하면 다음 칸 중앙에 도착한 것으로 보고 주변 검은 양털을 다시 검사합니다.
execute if score @s td.step matches 10.. at @s run function td:path/on_cell
