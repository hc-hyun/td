# 북쪽 후보가 td.branch_pick 번째 후보라면 다음 방향으로 선택합니다.
execute if score @s td.next matches 0 if score @s td.branch_pick matches 1 run scoreboard players set @s td.next 4
execute if score @s td.next matches 0 run scoreboard players remove @s td.branch_pick 1

