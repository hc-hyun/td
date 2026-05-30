# 활성 맵의 스폰 지점 중 하나를 균등 랜덤으로 선택합니다.
# 스폰 지점이 없으면 활성 맵 시작점을 선택합니다.
function td:spawn/select/clear
scoreboard players set $spawn_count td.spawn_count 0
scoreboard players set $spawn_pick td.spawn_pick 0
execute as @e[type=minecraft:marker,tag=td.spawn.active] run scoreboard players add $spawn_count td.spawn_count 1
execute if score $spawn_count td.spawn_count matches 0 run function td:spawn/select/fallback_start
execute if score $spawn_count td.spawn_count matches 1 run scoreboard players set $spawn_pick td.spawn_pick 1
execute if score $spawn_count td.spawn_count matches 2 store result score $spawn_pick td.spawn_pick run random value 1..2
execute if score $spawn_count td.spawn_count matches 3 store result score $spawn_pick td.spawn_pick run random value 1..3
execute if score $spawn_count td.spawn_count matches 4 store result score $spawn_pick td.spawn_pick run random value 1..4
execute if score $spawn_count td.spawn_count matches 5 store result score $spawn_pick td.spawn_pick run random value 1..5
execute if score $spawn_count td.spawn_count matches 6 store result score $spawn_pick td.spawn_pick run random value 1..6
execute if score $spawn_count td.spawn_count matches 7 store result score $spawn_pick td.spawn_pick run random value 1..7
execute if score $spawn_count td.spawn_count matches 8 store result score $spawn_pick td.spawn_pick run random value 1..8
execute if score $spawn_count td.spawn_count matches 1.. run function td:spawn/select/try_all
