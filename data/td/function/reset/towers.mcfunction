# 모든 아군 방어 유닛과 타워 관련 임시 상태를 초기화합니다.
kill @e[type=minecraft:mannequin,tag=td.tower]

# blink 복귀용 marker와 타워 임시 태그를 정리합니다.
kill @e[type=minecraft:marker,tag=td.tower.origin]
tag @e[tag=td.tower.active_blink] remove td.tower.active_blink
tag @e[tag=td.tower.returning] remove td.tower.returning
tag @e[tag=td.tower.return_origin] remove td.tower.return_origin
tag @e[tag=td.tower.target] remove td.tower.target
tag @e[tag=td.tower.hit] remove td.tower.hit
tag @e[tag=td.tower.remove_candidate] remove td.tower.remove_candidate
tag @e[tag=td.tower.remove_target] remove td.tower.remove_target
tag @a[tag=td.place.actor] remove td.place.actor
tag @a[tag=td.place.valid] remove td.place.valid
tag @a[tag=td.place.open] remove td.place.open

# 방어 유닛을 모두 지웠으므로 다음 배치 id를 처음부터 다시 씁니다.
scoreboard players set $next_tower_id td.tower_id 0
