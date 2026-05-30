# 활성 스폰 지점 전체에서 fast 적을 한 마리씩 소환합니다.
execute at @e[type=minecraft:marker,tag=td.spawn.active] run summon minecraft:vindicator ~ ~ ~ {Tags:["td.enemy","td.new","td.type.fast"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Fast',color:'yellow'},CustomNameVisible:1b}
execute unless entity @e[type=minecraft:marker,tag=td.spawn.active,limit=1] at @e[type=minecraft:marker,tag=td.start,limit=1] run summon minecraft:vindicator ~ ~ ~ {Tags:["td.enemy","td.new","td.type.fast"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Fast',color:'yellow'},CustomNameVisible:1b}

execute as @e[tag=td.new,tag=td.type.fast] at @s run function td:enemy/type/fast
execute as @e[tag=td.new,tag=td.type.fast] at @s run function td:spawn/common
