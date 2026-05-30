# 플레이어 기준 4블록 안의 가장 가까운 본인 소유 방어 유닛을 제거하고 환불합니다.
execute unless score @s td.player_id matches 1.. run function td:player/assign_id
tag @a remove td.place.actor
tag @s add td.place.actor

function td:tower/remove_owned

scoreboard players set @s td.place_cd 4
tag @s remove td.place.actor
