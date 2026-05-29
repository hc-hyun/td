# td.dir 값에 따라 적을 한 틱에 0.1블록씩 이동시킵니다.
# 10틱 동안 이동하면 총 1블록을 이동하므로, 기본 속도는 초당 2블록입니다.
# 1 = 동쪽(+X), 2 = 서쪽(-X), 3 = 남쪽(+Z), 4 = 북쪽(-Z)
execute if score @s td.dir matches 1 run tp @s ~0.1 ~ ~
execute if score @s td.dir matches 2 run tp @s ~-0.1 ~ ~
execute if score @s td.dir matches 3 run tp @s ~ ~ ~0.1
execute if score @s td.dir matches 4 run tp @s ~ ~ ~-0.1

# 현재 블록 안에서 이동한 틱 수를 1 증가시킵니다.
scoreboard players add @s td.step 1

# 10틱 이상 이동하면 다음 칸 중앙에 도착한 것으로 보고,
# 현재 위치를 보정한 뒤 주변 검은 양털을 다시 검사합니다.
execute if score @s td.step matches 10.. at @s run function td:path/on_cell
