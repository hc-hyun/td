# tank 타입 설정입니다.
# type 3, HP 30, speed 1(slow), scale 1.25를 사용합니다.
scoreboard players set @s td.type 3
scoreboard players set @s td.enemy_max_hp 30
scoreboard players set @s td.enemy_hp 30
scoreboard players set @s td.speed 1

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
