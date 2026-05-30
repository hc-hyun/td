# 선택된 스폰 위치에서 tank 타입 적을 소환합니다.
execute at @e[type=minecraft:marker,tag=td.spawn.selected,limit=1] run summon minecraft:pillager ~ ~ ~ {Tags:["td.enemy","td.new","td.type.tank"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Tank',color:'aqua'},CustomNameVisible:1b}

# 방금 소환된 tank 적에게 타입별 설정을 적용한 뒤 공통 초기화를 실행합니다.
execute as @e[tag=td.new,tag=td.type.tank] at @s run function td:enemy/type/tank
execute as @e[tag=td.new,tag=td.type.tank] at @s run function td:spawn/common
