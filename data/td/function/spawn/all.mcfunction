# 모든 활성 스폰 지점에서 지정 타입 적을 한 마리씩 소환합니다.
# 예: /function td:spawn/all {type:"tank"}
$execute at @e[type=minecraft:marker,tag=td.spawn.active] run function td:spawn/type/$(type)
$execute unless entity @e[type=minecraft:marker,tag=td.spawn.active,limit=1] at @e[type=minecraft:marker,tag=td.start,limit=1] run function td:spawn/type/$(type)
