# 현재 칸에 북쪽(-Z) 방향 가이드를 저장합니다.
tag @a remove td.path.guide.actor
tag @s add td.path.guide.actor
scoreboard players set @s td.path_dir 4
function td:path/guide/save
tellraw @s {text:'Path guide set: north (-Z).',color:'green'}
tag @s remove td.path.guide.actor
