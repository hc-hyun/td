# fast 타입 적을 소환합니다.
# 작은 vindicator 외형, 빠른 속도, 낮은 체력으로 빠르게 지나가는 적입니다.
execute at @e[type=minecraft:marker,tag=td.start,limit=1] run summon minecraft:vindicator ~ ~ ~ {Tags:["td.enemy","td.new","td.type.fast"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:{text:'Fast',color:'yellow'},CustomNameVisible:1b}

# 방금 소환된 fast 적에게 타입별 설정을 적용한 뒤 공통 초기화를 실행합니다.
execute as @e[tag=td.new,tag=td.type.fast] at @s run function td:enemy/type/fast
execute as @e[tag=td.new,tag=td.type.fast] at @s run function td:spawn/common
