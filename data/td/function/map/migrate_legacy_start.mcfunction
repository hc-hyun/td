# 기존 단일 시작점 marker(td.start만 가진 marker)를 새 다중 맵 marker 구조로 보정합니다.
tag @e[type=minecraft:marker,tag=td.map.migrate] remove td.map.migrate

# 활성 맵 marker가 불완전하게 남아 있어도 저장 맵 + 기존 스폰용 시작점으로 복구합니다.
tag @e[type=minecraft:marker,tag=td.map.active,tag=!td.map.start] add td.map.start
execute unless entity @e[type=minecraft:marker,tag=td.start,limit=1] as @e[type=minecraft:marker,tag=td.map.active,tag=td.map.start,limit=1] run tag @s add td.start

# 이미 td.start와 td.map.start가 함께 붙은 marker가 있으면 그 marker를 활성 맵으로 정규화합니다.
execute if entity @e[type=minecraft:marker,tag=td.start,tag=td.map.start,limit=1] run tag @e[type=minecraft:marker,tag=td.map.active] remove td.map.active
execute as @e[type=minecraft:marker,tag=td.start,tag=td.map.start,limit=1] run tag @s add td.map.active

# 예전 td.start marker만 있는 월드는 그 marker 하나를 저장/활성 맵으로 승격합니다.
execute unless entity @e[type=minecraft:marker,tag=td.start,tag=td.map.start,limit=1] as @e[type=minecraft:marker,tag=td.start,tag=!td.map.start,limit=1] run tag @s add td.map.migrate
tag @e[type=minecraft:marker,tag=td.map.migrate] add td.map.start
tag @e[type=minecraft:marker,tag=td.map.migrate] add td.map.active

# 혹시 여러 td.start marker가 남아 있으면 나머지는 저장 맵으로만 남깁니다.
tag @e[type=minecraft:marker,tag=td.start,tag=!td.map.start] add td.map.start
tag @e[type=minecraft:marker,tag=td.start,tag=!td.map.active] remove td.start
tag @e[type=minecraft:marker,tag=td.map.migrate] remove td.map.migrate
