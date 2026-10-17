execute store result score #dcid round run data get entity @s PortalCooldown
execute store result storage hideseek:tmp id int 1 run scoreboard players get #dcid round
function hideseek:dc_offline_macro with storage hideseek:tmp
