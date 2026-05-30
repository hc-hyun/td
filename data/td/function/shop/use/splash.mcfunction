scoreboard players set @s td.place_type 2
scoreboard players operation @s td.place_cost = $tower_splash_cost td.place_cost
function td:place/raycast/start
