# 선택된 compass origin 위치에서 라벨과 origin marker만 제거합니다.
particle minecraft:poof ~ ~1 ~ 0.35 0.35 0.35 0.02 12
kill @e[type=minecraft:text_display,tag=td.map.compass.text,distance=..3]
kill @e[type=minecraft:marker,tag=td.map.compass.remove,distance=..0.1]
