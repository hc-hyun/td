# 활성 맵의 코어 저장 상태와 현재 코어 HP를 표시합니다.
function td:core/activate_for_map
execute unless entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] run tellraw @s {text:'Active TD map: none',color:'red'}
execute if entity @e[type=minecraft:marker,tag=td.map.active,tag=td.start,limit=1] unless entity @e[type=minecraft:marker,tag=td.core.active,limit=1] run tellraw @s {text:'Active TD core: none. Stand on the core block and use /function td:core/save_here.',color:'yellow'}
execute if entity @e[type=minecraft:marker,tag=td.core.active,limit=1] run tellraw @s [{text:'Active TD core: saved, HP ',color:'aqua'},{score:{name:'$base',objective:'td.hp'},color:'yellow'},{text:' / ',color:'aqua'},{score:{name:'$core_hp',objective:'td.hp'},color:'yellow'}]
