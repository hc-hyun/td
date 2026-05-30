# basic 타입 설정입니다.
# HP, speed, reward, core damage는 td:config/enemy/basic에서 가져옵니다.
tag @s add td.type.basic
scoreboard players operation @s td.enemy_max_hp = $enemy_basic_hp td.enemy_max_hp
scoreboard players operation @s td.enemy_hp = $enemy_basic_hp td.enemy_max_hp
scoreboard players operation @s td.speed = $enemy_basic_speed td.speed
scoreboard players operation @s td.reward = $enemy_basic_reward td.reward
scoreboard players operation @s td.core_damage = $enemy_basic_core_damage td.core_damage

# 팀 색상과 충돌 방지 규칙을 적용합니다.
team join td_enemy_basic @s

# 기본 크기를 사용합니다.
attribute @s minecraft:scale base set 1.0

# 가벼운 장비로 basic 몹을 구분합니다.
item replace entity @s armor.head with minecraft:leather_helmet

# 타입별 소환 이펙트입니다.
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.4 0.3 0 8
playsound minecraft:entity.zombie.ambient master @a[distance=..16] ~ ~ ~ 0.4 1.2
