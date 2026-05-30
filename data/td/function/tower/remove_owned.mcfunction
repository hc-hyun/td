# 현재 플레이어가 소유한 가까운 타워만 제거 대상으로 고릅니다.
tag @e[tag=td.tower.remove_candidate] remove td.tower.remove_candidate
tag @e[tag=td.tower.remove_target] remove td.tower.remove_target

execute as @e[type=minecraft:mannequin,tag=td.tower,distance=..4] if score @s td.owner_id = @a[tag=td.place.actor,limit=1] td.player_id run tag @s add td.tower.remove_candidate
tag @e[type=minecraft:mannequin,tag=td.tower.remove_candidate,distance=..4,sort=nearest,limit=1] add td.tower.remove_target

execute unless entity @e[type=minecraft:mannequin,tag=td.tower.remove_target,limit=1] run function td:tower/refund/fail
execute as @e[type=minecraft:mannequin,tag=td.tower.remove_target,limit=1] at @s run function td:tower/refund/remove_one

tag @e[tag=td.tower.remove_candidate] remove td.tower.remove_candidate
tag @e[tag=td.tower.remove_target] remove td.tower.remove_target
