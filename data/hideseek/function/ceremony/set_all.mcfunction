# Set all four ceremony anchors at once, relative to your position:
#   gold and bronze 2 blocks either side, silver in the middle,
#   audience 12 blocks in front of the podium line (the crowd's front row).
# Fine-tune afterwards with the individual set_gold/set_silver/set_bronze/set_audience calls.
kill @e[type=minecraft:marker,tag=podium_gold]
kill @e[type=minecraft:marker,tag=podium_silver]
kill @e[type=minecraft:marker,tag=podium_bronze]
kill @e[type=minecraft:marker,tag=podium_audience]

execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~2 ~ ~ {Tags:["podium_gold"],tags:["podium_gold"]}
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["podium_silver"],tags:["podium_silver"]}
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~-2 ~ ~ {Tags:["podium_bronze"],tags:["podium_bronze"]}
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~12 {Tags:["podium_audience"],tags:["podium_audience"]}

tellraw @s {"text":"Ceremony anchors set around your position.","color":"aqua"}
