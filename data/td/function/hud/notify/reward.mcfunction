execute unless entity @s[tag=td.hud.reward] run function td:hud/notify/clear
execute unless entity @s[tag=td.hud.reward] run scoreboard players set @s td.hud_value 0
scoreboard players operation @s td.hud_value += $last_reward td.reward
scoreboard players set @s td.hud_ticks 40
tag @s add td.hud.reward
