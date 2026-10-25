scoreboard players operation #ticks round = #length round
execute store result bossbar hideseek:timer max run scoreboard players get #length round
bossbar set hideseek:timer color red
execute at @n[type=minecraft:marker,tag=spawn_seeker] run tp @a[tag=seeker] ~ ~ ~ ~ ~
title @a title {"text":"The seeker is loose!","color":"red"}
scoreboard players set #state round 1