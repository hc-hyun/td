# 실행 플레이어의 현재 개인 돈을 표시합니다.
execute unless score @s td.player_id matches 1.. run function td:player/assign_id
tellraw @s [{text:'Money: ',color:'gold'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
