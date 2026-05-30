# 새 게임 시작 또는 활성 맵 전환 시 온라인 플레이어 개인 돈을 시작값으로 되돌립니다.
scoreboard players operation @a td.money = $start_money td.money
scoreboard players set @a td.place_use 0
scoreboard players set @a td.place_cd 0
