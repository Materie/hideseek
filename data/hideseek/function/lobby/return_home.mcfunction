# Return a forced joiner to their saved dimension and position. Called as the
# player when leaving the roster or after the completed match / ceremony.
execute unless entity @s[tag=hs_home_saved] run return fail
execute store result storage hideseek:home x double 0.001 run scoreboard players get @s hs_home_x
execute store result storage hideseek:home y double 0.001 run scoreboard players get @s hs_home_y
execute store result storage hideseek:home z double 0.001 run scoreboard players get @s hs_home_z
scoreboard players set #home_return round 0
execute if score @s hs_home_dim matches 0 in minecraft:overworld run function hideseek:lobby/_return_coords with storage hideseek:home
execute if score @s hs_home_dim matches 1 in minecraft:the_nether run function hideseek:lobby/_return_coords with storage hideseek:home
execute if score @s hs_home_dim matches 2 in minecraft:the_end run function hideseek:lobby/_return_coords with storage hideseek:home
execute unless score #home_return round matches 1 run return run tellraw @s {"text":"Could not return to your saved location; it is still saved for another attempt.","color":"yellow"}
tag @s remove hs_home_saved
scoreboard players reset @s hs_home_x
scoreboard players reset @s hs_home_y
scoreboard players reset @s hs_home_z
scoreboard players reset @s hs_home_dim
