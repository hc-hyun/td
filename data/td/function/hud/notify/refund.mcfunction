function td:hud/notify/clear
scoreboard players operation @s td.hud_value = $last_refund td.refund
scoreboard players set @s td.hud_ticks 40
tag @s add td.hud.refund
