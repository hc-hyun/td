# 활성 스폰 지점 전체에서 tank 적을 한 마리씩 소환합니다.
execute at @e[type=minecraft:marker,tag=td.spawn.active] run summon minecraft:pillager ~ ~ ~ {Tags:["td.enemy","td.new","td.type.tank"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Tank',color:'aqua'},CustomNameVisible:1b}
execute unless entity @e[type=minecraft:marker,tag=td.spawn.active,limit=1] at @e[type=minecraft:marker,tag=td.start,limit=1] run summon minecraft:pillager ~ ~ ~ {Tags:["td.enemy","td.new","td.type.tank"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Tank',color:'aqua'},CustomNameVisible:1b}

execute as @e[tag=td.new,tag=td.type.tank] at @s run function td:enemy/type/tank
execute as @e[tag=td.new,tag=td.type.tank] at @s run function td:spawn/common
