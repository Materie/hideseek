kill @e[type=minecraft:marker,tag=podium_bronze]
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["podium_bronze"],tags:["podium_bronze"]}
tellraw @s {"text":"Bronze podium (3rd place) set to your position.","color":"#cd7f32"}
