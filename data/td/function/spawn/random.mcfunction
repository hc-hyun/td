# 활성 스폰 지점 중 하나를 랜덤으로 고른 뒤 지정 타입 적을 소환합니다.
# 예: /function td:spawn/random {type:"basic"}
function td:spawn/select/random
$execute at @e[type=minecraft:marker,tag=td.spawn.selected,limit=1] run function td:spawn/type/$(type)
function td:spawn/select/clear
