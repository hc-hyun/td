# 플레이어 위치에 광역 마법 방어 유닛을 배치합니다.
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:mannequin ~ ~ ~ {Tags:["td.tower","td.tower.splash","td.tower.new"],immovable:1b,NoGravity:1b,Invulnerable:1b,hide_description:1b,pose:"standing",profile:{texture:"minecraft:entity/player/wide/steve",model:"wide"},Rotation:[180f,0f]}

execute as @e[type=minecraft:mannequin,tag=td.tower.new,tag=td.tower.splash,sort=nearest,limit=1] at @s run function td:tower/type/splash
