# 적을 현재 경로 칸의 중앙으로 보정합니다.
# tp 이동을 여러 번 반복하면 소수점 오차가 생길 수 있으므로,
# 방향을 새로 고를 때마다 X/Z를 칸 중앙에 맞춰 안정적으로 이동하게 합니다.
execute at @s align xz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~

# 다음 방향 후보와 랜덤 분기 계산값을 초기화합니다.
# td.branch_count는 되돌아가는 방향을 제외한 후보 수, td.branch_pick은 그중 몇 번째 후보를 고를지입니다.
scoreboard players set @s td.next 0
scoreboard players set @s td.branch_count 0
scoreboard players set @s td.branch_pick 0

# 되돌아가는 방향을 제외하고 현재 칸에서 갈 수 있는 검은 양털 후보 수를 셉니다.
execute at @s unless score @s td.dir matches 2 if block ~1 ~-1 ~ minecraft:black_wool run scoreboard players add @s td.branch_count 1
execute at @s unless score @s td.dir matches 1 if block ~-1 ~-1 ~ minecraft:black_wool run scoreboard players add @s td.branch_count 1
execute at @s unless score @s td.dir matches 4 if block ~ ~-1 ~1 minecraft:black_wool run scoreboard players add @s td.branch_count 1
execute at @s unless score @s td.dir matches 3 if block ~ ~-1 ~-1 minecraft:black_wool run scoreboard players add @s td.branch_count 1

# 후보가 하나라면 그 후보를 고르고, 여러 개라면 1..후보수 중 하나를 적마다 랜덤으로 뽑습니다.
execute if score @s td.branch_count matches 1 run scoreboard players set @s td.branch_pick 1
execute if score @s td.branch_count matches 2 store result score @s td.branch_pick run random value 1..2
execute if score @s td.branch_count matches 3 store result score @s td.branch_pick run random value 1..3
execute if score @s td.branch_count matches 4 store result score @s td.branch_pick run random value 1..4

# 동, 서, 남, 북 순서로 후보를 훑으며 td.branch_pick 번째 후보를 td.next로 저장합니다.
execute at @s unless score @s td.dir matches 2 if block ~1 ~-1 ~ minecraft:black_wool run function td:path/branch/try_east
execute at @s unless score @s td.dir matches 1 if block ~-1 ~-1 ~ minecraft:black_wool run function td:path/branch/try_west
execute at @s unless score @s td.dir matches 4 if block ~ ~-1 ~1 minecraft:black_wool run function td:path/branch/try_south
execute at @s unless score @s td.dir matches 3 if block ~ ~-1 ~-1 minecraft:black_wool run function td:path/branch/try_north

# 다음 방향을 찾았다면 실제 이동 방향으로 적용합니다.
execute unless score @s td.next matches 0 run function td:path/apply_next

# 다음 방향을 찾지 못했다면 막다른 끝점에 도착한 것으로 처리합니다.
execute if score @s td.next matches 0 run function td:path/finish
