# 플레이어별 액션바 HUD를 갱신합니다.
execute unless entity @s[tag=td.hud.hidden] if score @s td.hud_ticks matches 1.. run function td:hud/render/alert
execute unless entity @s[tag=td.hud.hidden] unless score @s td.hud_ticks matches 1.. run function td:hud/render/status

execute unless entity @s[tag=td.hud.hidden] if score @s td.hud_ticks matches 1.. run scoreboard players remove @s td.hud_ticks 1
execute unless entity @s[tag=td.hud.hidden] if score @s td.hud_ticks matches ..0 run function td:hud/notify/clear
