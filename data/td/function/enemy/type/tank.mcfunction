# tank 타입 설정입니다.
# HP, speed, reward, core damage는 td:config/enemy/tank에서 가져옵니다.
tag @s add td.type.tank
scoreboard players operation @s td.enemy_max_hp = $enemy_tank_hp td.enemy_max_hp
scoreboard players operation @s td.enemy_hp = $enemy_tank_hp td.enemy_max_hp
scoreboard players operation @s td.speed = $enemy_tank_speed td.speed
scoreboard players operation @s td.reward = $enemy_tank_reward td.reward
scoreboard players operation @s td.core_damage = $enemy_tank_core_damage td.core_damage

# 팀 색상과 충돌 방지 규칙을 적용합니다.
team join td_enemy_tank @s

# 탱커는 크게 만들어 체력 많은 적이라는 느낌을 줍니다.
attribute @s minecraft:scale base set 1.25

# 묵직한 적 느낌을 위해 방패와 철 헬멧을 장착합니다.
item replace entity @s armor.head with minecraft:iron_helmet
item replace entity @s weapon.offhand with minecraft:shield

# 타입별 소환 이펙트입니다.
particle minecraft:poof ~ ~1 ~ 0.5 0.45 0.5 0.02 18
playsound minecraft:entity.pillager.ambient master @a[distance=..16] ~ ~ ~ 0.5 0.8
