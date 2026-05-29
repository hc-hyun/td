# 매 틱마다 td.enemy 태그가 붙은 모든 적을 각각 실행 주체로 잡습니다.
# at @s를 함께 써서 각 적의 현재 위치 기준으로 이동과 경로 검사를 처리합니다.
execute as @e[tag=td.enemy] at @s run function td:enemy/tick
