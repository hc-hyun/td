# 현재 실행 위치는 플레이어가 선 칸의 X/Z 중앙입니다.
# 주변 바닥 블록은 실제로 교체되며, 제거 명령은 떠 있는 글자만 지웁니다.
kill @e[type=minecraft:text_display,tag=td.map.compass.text,distance=..3]
kill @e[type=minecraft:marker,tag=td.map.compass.origin,distance=..0.75]

setblock ~1 ~-1 ~ minecraft:red_concrete
setblock ~-1 ~-1 ~ minecraft:blue_concrete
setblock ~ ~-1 ~1 minecraft:yellow_concrete
setblock ~ ~-1 ~-1 minecraft:light_blue_concrete

summon minecraft:marker ~ ~ ~ {Tags:["td.map.compass.origin"]}
summon minecraft:text_display ~1 ~0.65 ~ {Tags:["td.map.compass.text"],text:{text:'동 +X',color:'red',bold:true},billboard:"center",alignment:"center",shadow:1b,see_through:1b,background:1073741824,line_width:120,transformation:{scale:[1.4f,1.4f,1.4f]}}
summon minecraft:text_display ~-1 ~0.65 ~ {Tags:["td.map.compass.text"],text:{text:'서 -X',color:'blue',bold:true},billboard:"center",alignment:"center",shadow:1b,see_through:1b,background:1073741824,line_width:120,transformation:{scale:[1.4f,1.4f,1.4f]}}
summon minecraft:text_display ~ ~0.65 ~1 {Tags:["td.map.compass.text"],text:{text:'남 +Z',color:'yellow',bold:true},billboard:"center",alignment:"center",shadow:1b,see_through:1b,background:1073741824,line_width:120,transformation:{scale:[1.4f,1.4f,1.4f]}}
summon minecraft:text_display ~ ~0.65 ~-1 {Tags:["td.map.compass.text"],text:{text:'북 -Z',color:'aqua',bold:true},billboard:"center",alignment:"center",shadow:1b,see_through:1b,background:1073741824,line_width:120,transformation:{scale:[1.4f,1.4f,1.4f]}}

particle minecraft:happy_villager ~ ~1 ~ 0.4 0.25 0.4 0 12
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.6 1.2
tellraw @s {text:'Compass placed. Direction blocks stay; use /function td:map/compass/remove_labels_nearest to remove floating labels.',color:'green'}
