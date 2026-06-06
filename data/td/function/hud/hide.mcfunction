tag @s add td.hud.hidden
scoreboard players set @s td.hud_ticks 0
function td:hud/notify/clear
title @s actionbar {text:''}
tellraw @s {text:'TD HUD hidden. Use /function td:hud/show to show it again.',color:'yellow'}
