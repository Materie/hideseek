tag @e[tag=hider_pos] remove fresh
execute as @a[tag=hider] at @s run function hideseek:dc/tick
execute as @e[tag=hider_pos,tag=!fresh] at @s run function hideseek:dc/offline
