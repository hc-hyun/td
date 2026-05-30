# 현재 위치의 X/Z 칸 중앙에 저장 맵 시작점을 만들고 즉시 활성화합니다.
# 같은 위치 근처의 기존 map marker는 교체합니다.
tag @e[type=minecraft:marker,tag=td.map.activate_candidate] remove td.map.activate_candidate
execute align xz positioned ~0.5 ~ ~0.5 run kill @e[type=minecraft:marker,tag=td.map.start,distance=..1]
execute align xz positioned ~0.5 ~ ~0.5 run kill @e[type=minecraft:marker,tag=td.start,tag=!td.map.start,distance=..1]
execute align xz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["td.map.start","td.map.activate_candidate"]}
tellraw @a[distance=..8] {text:'TD map start saved.',color:'green'}
function td:map/activate_candidate
