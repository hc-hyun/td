# 막다른 끝점이 활성 코어 근처라면 코어 피해를 처리합니다.
execute if entity @e[type=minecraft:marker,tag=td.core.active,distance=..1.25,limit=1] run function td:path/core_hit

# 코어가 아닌 막다른 길은 맵 제작 오류로 보고 코어 HP를 깎지 않습니다.
execute unless entity @e[type=minecraft:marker,tag=td.core.active,distance=..1.25,limit=1] run function td:path/dead_end_error
