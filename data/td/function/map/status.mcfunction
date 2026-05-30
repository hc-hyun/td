# 활성 맵 존재 여부와 현재 게임 상태를 표시합니다.
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a {text:'Active TD map: yes',color:'green'}
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @a {text:'Active TD map: none',color:'red'}
function td:wave/status
