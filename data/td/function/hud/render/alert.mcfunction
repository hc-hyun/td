# 짧은 HUD 알림입니다. 현재 실행자는 플레이어입니다.
execute if entity @s[tag=td.hud.reward] run title @s actionbar [{text:'Reward +',color:'gold'},{score:{name:'@s',objective:'td.hud_value'},color:'yellow'},{text:' | Money ',color:'gold'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
execute if entity @s[tag=td.hud.placed] run title @s actionbar [{text:'Tower placed',color:'green'},{text:' | Money ',color:'gold'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
execute if entity @s[tag=td.hud.no_money] run title @s actionbar [{text:'Not enough money',color:'red'},{text:' | Money ',color:'gold'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
execute if entity @s[tag=td.hud.no_target] run title @s actionbar {text:'No block in range.',color:'red'}
execute if entity @s[tag=td.hud.invalid] run title @s actionbar {text:'Cannot place tower there.',color:'red'}
execute if entity @s[tag=td.hud.refund] run title @s actionbar [{text:'Tower refunded +',color:'green'},{score:{name:'@s',objective:'td.hud_value'},color:'yellow'},{text:' | Money ',color:'gold'},{score:{name:'@s',objective:'td.money'},color:'yellow'}]
execute if entity @s[tag=td.hud.refund_fail] run title @s actionbar {text:'No owned tower nearby.',color:'red'}
execute unless entity @s[tag=td.hud.reward] unless entity @s[tag=td.hud.placed] unless entity @s[tag=td.hud.no_money] unless entity @s[tag=td.hud.no_target] unless entity @s[tag=td.hud.invalid] unless entity @s[tag=td.hud.refund] unless entity @s[tag=td.hud.refund_fail] run function td:hud/render/status
