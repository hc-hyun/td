# 적을 현재 경로 칸의 중앙으로 보정합니다.
# tp 이동을 여러 번 반복하면 소수점 오차가 생길 수 있으므로,
# 방향을 새로 고를 때마다 X/Z를 칸 중앙에 맞춰 안정적으로 이동하게 합니다.
execute at @s align xz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~

# 다음 방향 후보를 0으로 초기화합니다.
# 아래 검사 중 검은 양털이 발견되면 td.next가 1~4 중 하나로 바뀝니다.
scoreboard players set @s td.next 0

# 동쪽(+X) 칸 아래 블록이 검은 양털인지 검사합니다.
# 직전에 서쪽(-X)으로 이동 중이었다면, 방금 온 길로 되돌아가지 않도록 동쪽 검사를 건너뜁니다.
execute at @s if score @s td.next matches 0 unless score @s td.dir matches 2 if block ~1 ~-1 ~ minecraft:black_wool run scoreboard players set @s td.next 1

# 서쪽(-X) 칸 아래 블록이 검은 양털인지 검사합니다.
# 직전에 동쪽(+X)으로 이동 중이었다면 되돌아가는 방향이므로 건너뜁니다.
execute at @s if score @s td.next matches 0 unless score @s td.dir matches 1 if block ~-1 ~-1 ~ minecraft:black_wool run scoreboard players set @s td.next 2

# 남쪽(+Z) 칸 아래 블록이 검은 양털인지 검사합니다.
# 직전에 북쪽(-Z)으로 이동 중이었다면 되돌아가는 방향이므로 건너뜁니다.
execute at @s if score @s td.next matches 0 unless score @s td.dir matches 4 if block ~ ~-1 ~1 minecraft:black_wool run scoreboard players set @s td.next 3

# 북쪽(-Z) 칸 아래 블록이 검은 양털인지 검사합니다.
# 직전에 남쪽(+Z)으로 이동 중이었다면 되돌아가는 방향이므로 건너뜁니다.
execute at @s if score @s td.next matches 0 unless score @s td.dir matches 3 if block ~ ~-1 ~-1 minecraft:black_wool run scoreboard players set @s td.next 4

# 다음 방향을 찾았다면 실제 이동 방향으로 적용합니다.
execute unless score @s td.next matches 0 run function td:path/apply_next

# 다음 방향을 찾지 못했다면 막다른 끝점에 도착한 것으로 처리합니다.
execute if score @s td.next matches 0 run function td:path/finish
