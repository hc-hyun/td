tag @s remove td.hud.hidden
scoreboard players set @s td.hud_ticks 0
function td:hud/notify/clear
tellraw @s {text:'TD HUD shown.',color:'green'}
