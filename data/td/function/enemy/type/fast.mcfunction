# fast 타입 설정입니다.
# HP, speed, reward는 td:config/enemy/fast에서 가져옵니다.
scoreboard players set @s td.type 2
scoreboard players operation @s td.enemy_max_hp = $enemy_fast_hp td.enemy_max_hp
scoreboard players operation @s td.enemy_hp = $enemy_fast_hp td.enemy_max_hp
scoreboard players operation @s td.speed = $enemy_fast_speed td.speed
scoreboard players operation @s td.reward = $enemy_fast_reward td.reward

# 팀 색상과 충돌 방지 규칙을 적용합니다.
team join td_enemy_fast @s

# 빠른 적은 조금 작게 만들어 시각적으로 구분합니다.
attribute @s minecraft:scale base set 0.85

# 빠른 적 느낌을 주기 위해 도끼를 들게 합니다.
item replace entity @s weapon.mainhand with minecraft:iron_axe

# 타입별 소환 이펙트입니다.
particle minecraft:crit ~ ~1 ~ 0.35 0.35 0.35 0.1 12
playsound minecraft:entity.vindicator.ambient master @a[distance=..16] ~ ~ ~ 0.45 1.5
