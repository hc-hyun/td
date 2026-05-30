# 활성 맵의 특정 번호 스폰 지점에서 지정 타입 적을 소환합니다.
# 예: /function td:spawn/from {type:"fast",id:2}
function td:spawn/select/clear
$scoreboard players set $requested_spawn_id td.spawn_id $(id)
function td:spawn/select/requested
$execute at @e[type=minecraft:marker,tag=td.spawn.selected,limit=1] run function td:spawn/type/$(type)
function td:spawn/select/clear
