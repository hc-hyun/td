# carrot_on_a_stick 우클릭을 손에 든 custom_data에 따라 배치/제거 행동으로 분기합니다.
tag @a remove td.place.actor
tag @s add td.place.actor

scoreboard players set @s td.place_type 0
scoreboard players set @s td.place_cost 0

execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[custom_data~{td:{tool:"tower",tower:"basic"}}] run function td:shop/use/basic
execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[custom_data~{td:{tool:"tower",tower:"splash"}}] run function td:shop/use/splash
execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[custom_data~{td:{tool:"tower",tower:"blink"}}] run function td:shop/use/blink
execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[custom_data~{td:{tool:"remove_tower"}}] run function td:shop/use/remove_tower

tag @s remove td.place.actor
