# boss 타입 설정입니다.
# HP, speed, reward는 td:config/enemy/boss에서 가져옵니다.
tag @s add td.type.boss
scoreboard players operation @s td.enemy_max_hp = $enemy_boss_hp td.enemy_max_hp
scoreboard players operation @s td.enemy_hp = $enemy_boss_hp td.enemy_max_hp
scoreboard players operation @s td.speed = $enemy_boss_speed td.speed
scoreboard players operation @s td.reward = $enemy_boss_reward td.reward

# 팀 색상과 충돌 방지 규칙을 적용합니다.
team join td_enemy_boss @s

# 보스는 가장 크게 만들어 즉시 알아볼 수 있게 합니다.
attribute @s minecraft:scale base set 1.5

# 보스 느낌을 위해 금 헬멧과 블레이즈 막대를 장착합니다.
item replace entity @s armor.head with minecraft:golden_helmet
item replace entity @s weapon.mainhand with minecraft:blaze_rod

# 타입별 소환 이펙트입니다.
particle minecraft:enchant ~ ~1.2 ~ 0.6 0.7 0.6 0.2 40
playsound minecraft:entity.evoker.ambient master @a[distance=..24] ~ ~ ~ 0.8 0.7
