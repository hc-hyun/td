# 타워 공격에서 쓰는 임시 태그와 원위치 마커를 정리합니다.
tag @e[tag=td.tower.target] remove td.tower.target
tag @e[tag=td.tower.hit] remove td.tower.hit
tag @e[tag=td.tower.active_blink] remove td.tower.active_blink
tag @e[tag=td.tower.returning] remove td.tower.returning
tag @e[tag=td.tower.return_origin] remove td.tower.return_origin
execute unless entity @e[type=minecraft:mannequin,tag=td.tower.blinking] run kill @e[type=minecraft:marker,tag=td.tower.origin]
