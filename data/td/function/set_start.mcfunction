# 기존 시작점 marker를 모두 제거합니다.
# 시작점은 하나만 사용하므로 새로 저장할 때 이전 값을 정리합니다.
kill @e[type=minecraft:marker,tag=td.start]

# 실행자의 현재 X/Z 칸을 기준으로 중앙 위치에 marker를 소환합니다.
# marker는 보이지 않고 동작이 거의 없는 엔티티라 위치 저장용으로 적합합니다.
# Y 좌표는 실행자가 서 있는 높이를 그대로 사용합니다.
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["td.start"]}

# 가까운 플레이어에게 시작점 저장 완료 메시지를 보여줍니다.
tellraw @a[distance=..4] {text:'TD start point saved.',color:'green'}
