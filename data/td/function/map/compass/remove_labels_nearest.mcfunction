# 플레이어 8블록 안의 가장 가까운 compass 라벨과 기준 marker를 제거합니다.
# 바닥 방향 블록은 원래 블록을 저장하지 않으므로 유지합니다.
tag @e[type=minecraft:marker,tag=td.map.compass.remove] remove td.map.compass.remove
execute as @e[type=minecraft:marker,tag=td.map.compass.origin,distance=..8,sort=nearest,limit=1] run tag @s add td.map.compass.remove

execute unless entity @e[type=minecraft:marker,tag=td.map.compass.remove,limit=1] run tellraw @s {text:'No compass labels within 8 blocks.',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.compass.remove,limit=1] run tellraw @s {text:'Compass labels removed. Direction blocks were left in place.',color:'yellow'}
execute if entity @e[type=minecraft:marker,tag=td.map.compass.remove,limit=1] at @e[type=minecraft:marker,tag=td.map.compass.remove,limit=1] run function td:map/compass/remove_labels_one
