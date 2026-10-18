kill @e[type=minecraft:marker,tag=bound_centre]
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["bound_centre"]}
tellraw @s {"text":"Boundary centre set to your position.","color":"gray"}
