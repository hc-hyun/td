# 플레이어 위치에 기본 방어 유닛을 배치합니다.
# 현재 블록의 중앙에 고정 mannequin을 소환하고 기본 장비와 쿨타임을 설정합니다.
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:mannequin ~ ~ ~ {Tags:["td.tower","td.tower.basic","td.tower.new"],immovable:1b,NoGravity:1b,Invulnerable:1b,hide_description:1b,pose:"standing",profile:{texture:"minecraft:entity/player/wide/steve",model:"wide"},Rotation:[180f,0f]}

execute as @e[type=minecraft:mannequin,tag=td.tower.new] at @s run function td:tower/init/basic
