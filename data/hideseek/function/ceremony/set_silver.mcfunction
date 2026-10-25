kill @e[type=minecraft:marker,tag=podium_silver]
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["podium_silver"],tags:["podium_silver"]}
tellraw @s {"text":"Silver podium (2nd place / podium centre) set to your position.","color":"gray"}
