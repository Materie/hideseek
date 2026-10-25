tag @s remove hider
scoreboard players set @s status 3
scoreboard players set @s died 0
gamemode spectator @s
execute at @n[type=minecraft:marker,tag=spawn_hider] run tp @s ~ ~ ~ ~ ~
# Clean up this hider's position marker and any dc husk
execute store result storage hideseek:tmp id int 1 run scoreboard players get @s hid
function hideseek:dc/caught_cleanup with storage hideseek:tmp
tellraw @a [{"selector":"@s"},{"text":" was caught!","color":"red"}]