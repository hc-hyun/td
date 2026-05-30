# 새 플레이어에게 타워 소유권 비교용 고유 번호와 시작 돈을 부여합니다.
scoreboard players add $next_player_id td.player_id 1
scoreboard players operation @s td.player_id = $next_player_id td.player_id
scoreboard players operation @s td.money = $start_money td.money
scoreboard players set @s td.place_use 0
scoreboard players set @s td.place_cd 0

tellraw @s [{text:'BlackWoolTD ready. Money: ',color:'gold'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
