# td.next에 저장된 다음 방향 후보를 실제 이동 방향 td.dir로 복사합니다.
scoreboard players operation @s td.dir = @s td.next

# 새 블록 방향으로 이동을 시작하므로 블록 내부 이동 틱 수를 0으로 되돌립니다.
scoreboard players set @s td.step 0
