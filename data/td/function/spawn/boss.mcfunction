# boss 타입 적을 소환합니다.
# 큰 evoker 외형, 느린 속도, 매우 높은 체력으로 보스 웨이브용 적입니다.
execute at @e[type=minecraft:marker,tag=td.start,limit=1] run summon minecraft:evoker ~ ~ ~ {Tags:["td.enemy","td.new","td.type.boss"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,CustomName:'{"text":"Boss","color":"dark_purple","bold":true}',CustomNameVisible:1b}

# 방금 소환된 boss 적에게 타입별 설정을 적용한 뒤 공통 초기화를 실행합니다.
execute as @e[tag=td.new,tag=td.type.boss] at @s run function td:enemy/type/boss
execute as @e[tag=td.new,tag=td.type.boss] at @s run function td:spawn/common
