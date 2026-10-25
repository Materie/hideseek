kill @e[type=minecraft:marker,tag=podium_audience]
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["podium_audience"],tags:["podium_audience"]}
tellraw @s {"text":"Audience origin set: the crowd's front row centre is here, facing the podium.","color":"aqua"}
