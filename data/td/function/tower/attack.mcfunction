# 기본 방어 유닛 공격입니다.
# 사거리 안의 가장 가까운 적을 바라보고 팔 휘두르기, 이펙트, 점수판 데미지를 처리합니다.
scoreboard players set @s td.tower_cd 0

tp @s ~ ~ ~ facing entity @e[tag=td.enemy,distance=..8,limit=1,sort=nearest] eyes
swing @s mainhand

execute at @s positioned ^ ^1.2 ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
playsound minecraft:entity.player.attack.sweep master @a[distance=..16] ~ ~ ~ 0.7 1.15

execute as @e[tag=td.enemy,distance=..8,limit=1,sort=nearest] at @s run function td:tower/damage/basic
