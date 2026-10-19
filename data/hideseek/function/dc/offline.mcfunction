# The DC id rides in the marker's PortalCooldown field; probe showed the classic spelling
# is live on this version - the fallback line only runs if the first read failed.
scoreboard players set #dcid round -99999
execute store result score #dcid round run data get entity @s PortalCooldown
execute if score #dcid round matches -99999 store result score #dcid round run data get entity @s portal_cooldown
execute store result storage hideseek:tmp id int 1 run scoreboard players get #dcid round
function hideseek:dc/offline_macro with storage hideseek:tmp
