# 전투 중이면 50%, 그 외 상태면 100%를 소유자에게 환불하고 타워를 제거합니다.
execute unless score @s td.tower_cost matches 0.. run scoreboard players set @s td.tower_cost 0
scoreboard players operation @s td.refund = @s td.tower_cost
execute if score $wave_state td.wave_state matches 1 run scoreboard players operation @s td.refund /= $combat_refund_divisor td.tmp

scoreboard players operation @a[tag=td.place.actor,limit=1] td.refund = @s td.refund
scoreboard players operation @a[tag=td.place.actor,limit=1] td.money += @s td.refund
scoreboard players operation $last_refund td.refund = @s td.refund

particle minecraft:poof ~ ~1 ~ 0.3 0.4 0.3 0.02 12
playsound minecraft:block.note_block.bass master @a[distance=..16] ~ ~ ~ 0.6 0.8
title @a[tag=td.place.actor,limit=1] actionbar [{text:'Tower refunded ',color:'green'},{score:{name:'$last_refund',objective:'td.refund'},color:'yellow'}]

kill @s
