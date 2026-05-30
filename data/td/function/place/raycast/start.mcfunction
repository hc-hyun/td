# 돈이 충분하면 플레이어 시선 방향으로 최대 6블록까지 설치할 블록을 찾습니다.
execute unless score @s td.money >= @s td.place_cost run function td:place/fail/no_money
execute if score @s td.money >= @s td.place_cost run function td:place/raycast/begin
