# 선택된 스폰 위치에서 fast 타입 적을 소환합니다.
execute at @e[type=minecraft:marker,tag=td.spawn.selected,limit=1] run summon minecraft:vindicator ~ ~ ~ {Tags:["td.enemy","td.new","td.type.fast"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Fast',color:'yellow'},CustomNameVisible:1b}

# 방금 소환된 fast 적에게 타입별 설정을 적용한 뒤 공통 초기화를 실행합니다.
execute as @e[tag=td.new,tag=td.type.fast] at @s run function td:enemy/type/fast
execute as @e[tag=td.new,tag=td.type.fast] at @s run function td:spawn/common
