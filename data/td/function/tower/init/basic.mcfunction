# 기본 방어 유닛 설정입니다.
# 이 함수는 새로 소환된 mannequin 자신을 @s로 잡은 상태에서 실행해야 합니다.
scoreboard players set @s td.tower_cd 40

team join td_tower @s
attribute @s minecraft:scale base set 1.0

# v1은 바닐라 장비만 사용합니다.
# 리소스팩을 추가하면 이 손 장비에 minecraft:item_model을 붙여 커스텀 무기처럼 보이게 확장할 수 있습니다.
item replace entity @s weapon.mainhand with minecraft:iron_sword
item replace entity @s armor.head with minecraft:leather_helmet

particle minecraft:happy_villager ~ ~1 ~ 0.3 0.4 0.3 0 8
playsound minecraft:block.note_block.pling master @a[distance=..16] ~ ~ ~ 0.6 1.4

tag @s remove td.tower.new
