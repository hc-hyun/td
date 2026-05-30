# 적의 점수판 HP가 0 이하가 되었을 때 실행하는 공통 제거 함수입니다.
particle minecraft:poof ~ ~1 ~ 0.35 0.45 0.35 0.03 16
playsound minecraft:entity.generic.death master @a[distance=..16] ~ ~ ~ 0.6 1.1

kill @s
