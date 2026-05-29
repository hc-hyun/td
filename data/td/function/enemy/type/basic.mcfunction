# basic 타입 설정입니다.
# type 1, HP 10, speed 2(normal), scale 1.0을 사용합니다.
scoreboard players set @s td.type 1
scoreboard players set @s td.enemy_max_hp 10
scoreboard players set @s td.enemy_hp 10
scoreboard players set @s td.speed 2

# 팀 색상과 충돌 방지 규칙을 적용합니다.
team join td_enemy_basic @s

# 기본 크기를 사용합니다.
attribute @s minecraft:scale base set 1.0

# 가벼운 장비로 basic 몹을 구분합니다.
item replace entity @s armor.head with minecraft:leather_helmet

# 타입별 소환 이펙트입니다.
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.4 0.3 0 8
playsound minecraft:entity.zombie.ambient master @a[distance=..16] ~ ~ ~ 0.4 1.2
