scoreboard players set @s td.place_type 3
scoreboard players operation @s td.place_cost = $tower_blink_cost td.place_cost
function td:place/raycast/start
