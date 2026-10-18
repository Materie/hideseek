$execute if score dc_$(id) dc_state matches 0 run function hideseek:dc/spawn with storage hideseek:tmp
$execute if score dc_$(id) dc_state matches 1 unless entity @e[tag=dc_$(id),type=minecraft:husk] run scoreboard players set dc_$(id) dc_state 2
$execute if score dc_$(id) dc_state matches 1 unless entity @e[tag=dc_$(id),type=minecraft:husk] run kill @s
