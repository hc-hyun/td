# 현재 위치에 tank 타입 적을 소환하고 초기화합니다.
summon minecraft:pillager ~ ~ ~ {Tags:["td.enemy","td.new","td.type.tank"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Tank',color:'aqua'},CustomNameVisible:1b}

execute as @e[tag=td.new,tag=td.type.tank,sort=nearest,limit=1] at @s run function td:enemy/type/tank
execute as @e[tag=td.new,tag=td.type.tank,sort=nearest,limit=1] at @s run function td:spawn/common
