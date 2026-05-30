scoreboard players set @s td.place_cd 4
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.5 0.7
title @s actionbar [{text:'Not enough money. Money ',color:'red'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
