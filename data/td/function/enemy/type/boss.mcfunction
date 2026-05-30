# boss 타입 설정입니다.
# type 4, HP 100, speed 1(slow), scale 1.5를 사용합니다.
scoreboard players set @s td.type 4
scoreboard players set @s td.enemy_max_hp 100
scoreboard players set @s td.enemy_hp 100
scoreboard players set @s td.speed 1
scoreboard players set @s td.reward 80

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
