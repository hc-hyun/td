# 모든 적 유닛과 적 관련 UI 상태를 초기화합니다.
kill @e[tag=td.enemy]

# 타워 공격 중 적에게 붙었을 수 있는 임시 태그를 정리합니다.
tag @e[tag=td.tower.target] remove td.tower.target
tag @e[tag=td.tower.hit] remove td.tower.hit

# bossbar는 살아 있는 boss가 없을 때 숨기고 값을 비웁니다.
scoreboard players set $boss_hp td.tmp 0
scoreboard players set $boss_max td.tmp 0
bossbar set td:boss value 0
bossbar set td:boss max 1
bossbar set td:boss visible false
