scoreboard players set @s td.place_type 1
scoreboard players operation @s td.place_cost = $tower_basic_cost td.place_cost
function td:place/raycast/start
