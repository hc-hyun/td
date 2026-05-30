# 현재 칸에 서쪽(-X) 방향 가이드를 저장합니다.
tag @a remove td.path.guide.actor
tag @s add td.path.guide.actor
scoreboard players set @s td.path_dir 2
function td:path/guide/save
tellraw @s {text:'Path guide set: west (-X).',color:'green'}
tag @s remove td.path.guide.actor
