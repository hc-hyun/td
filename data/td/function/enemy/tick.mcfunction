# 방향이 아직 0이면 현재 칸에서 주변 검은 양털을 검사해 방향을 정합니다.
execute if score @s td.dir matches 0 run function td:path/on_cell

# 방향이 정해진 적은 그 방향으로 조금씩 이동합니다.
# 실제 한 블록 단위 방향 전환은 td:enemy/move 안에서 td.step이 10에 도달했을 때 일어납니다.
execute unless score @s td.dir matches 0 run function td:enemy/move
