$tp @e[tag=hider_pos_$(id),limit=1] ~ ~ ~
$tag @e[tag=hider_pos_$(id),limit=1] add fresh
$execute if score dc_$(id) dc_state matches 1 run function hideseek:dc_restore with storage hideseek:tmp
$execute if score dc_$(id) dc_state matches 2 run function hideseek:hider_caught
