# carrot_on_a_stick 우클릭을 손에 든 custom_data에 따라 배치/제거 행동으로 분기합니다.
tag @a remove td.place.actor
tag @s add td.place.actor

function td:tower/select/clear
scoreboard players set @s td.place_cost 0

function #td:shop/use_items
execute if entity @s[tag=td.place.tower] run function td:place/raycast/start

function td:tower/select/clear
tag @s remove td.place.actor
