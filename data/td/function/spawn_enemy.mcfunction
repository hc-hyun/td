# 저장된 td.start marker 위치에서 좀비 적을 소환합니다.
# td.enemy는 매 틱 처리 대상 태그이고, td.new는 방금 소환된 적만 초기화하기 위한 임시 태그입니다.
# NoAI와 NoGravity를 켜서 바닐라 AI나 중력 대신 데이터팩 tp 이동만 적용되게 합니다.
execute at @e[type=minecraft:marker,tag=td.start,limit=1] run summon minecraft:zombie ~ ~ ~ {Tags:["td.enemy","td.new"],NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b}

# 새 적을 충돌 방지 팀에 넣습니다.
team join td_enemy @e[tag=td.new]

# 새 적의 이동 상태를 초기화합니다.
# td.dir 0은 아직 이동 방향이 정해지지 않은 상태입니다.
# td.step은 현재 블록 안에서 이동한 틱 수, td.next는 다음 방향 후보입니다.
scoreboard players set @e[tag=td.new] td.dir 0
scoreboard players set @e[tag=td.new] td.step 0
scoreboard players set @e[tag=td.new] td.next 0

# 소환 직후 현재 칸에서 주변 검은 양털을 검사해 첫 이동 방향을 정합니다.
execute as @e[tag=td.new] at @s run function td:path/on_cell

# 초기화가 끝난 적에서 임시 태그를 제거합니다.
tag @e[tag=td.new] remove td.new
