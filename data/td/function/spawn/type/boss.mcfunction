# 현재 위치에 boss 타입 적을 소환하고 초기화합니다.
summon minecraft:evoker ~ ~ ~ {Tags:["td.enemy","td.new","td.type.boss"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Boss',color:'dark_purple',bold:true},CustomNameVisible:1b}

execute as @e[tag=td.new,tag=td.type.boss,sort=nearest,limit=1] at @s run function td:enemy/type/boss
execute as @e[tag=td.new,tag=td.type.boss,sort=nearest,limit=1] at @s run function td:spawn/common
