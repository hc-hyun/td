# 적이 활성 코어에 도착했을 때 타입별 코어 피해를 적용합니다.
execute unless score @s td.core_damage matches 1.. run scoreboard players set @s td.core_damage 1
scoreboard players operation $base td.hp -= @s td.core_damage

particle minecraft:angry_villager ~ ~1 ~ 0.3 0.35 0.3 0.02 8
playsound minecraft:block.beacon.deactivate master @a[distance=..24] ~ ~ ~ 0.45 1.2
kill @s
