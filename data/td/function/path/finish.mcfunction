# 적이 경로의 막다른 끝에 도착하면 기지 체력을 1 줄입니다.
scoreboard players remove $base td.hp 1

# 도착 지점에 간단한 파티클을 표시해 테스트 중 확인하기 쉽게 합니다.
particle minecraft:angry_villager ~ ~1 ~ 0.3 0.3 0.3 0 5

# 목적지에 도착한 적은 제거합니다.
kill @s
