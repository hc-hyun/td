# 플레이어별 1회 초기화와 상점 아이템 우클릭 입력을 처리합니다.
execute unless score @s td.player_id matches 1.. run function td:player/assign_id

execute if score @s td.place_cd matches 1.. run scoreboard players remove @s td.place_cd 1
execute if score @s td.place_use matches 1.. if score @s td.place_cd matches ..0 run function td:shop/use
scoreboard players set @s td.place_use 0

function td:hud/tick
