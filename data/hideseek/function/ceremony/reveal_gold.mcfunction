scoreboard players set #cer_phase round 3
execute at @n[type=minecraft:marker,tag=podium_gold] run summon minecraft:marker ~ ~ ~ {Tags:["cer_stack"],tags:["cer_stack"]}
execute store result score #cer_ties round if entity @a[tag=pod_1]
execute if score #cer_ties round matches 1 as @a[tag=pod_1] run function hideseek:ceremony/place_one
execute if score #cer_ties round matches 2.. as @a[tag=pod_1] run function hideseek:ceremony/place_tied
kill @e[type=minecraft:marker,tag=cer_stack]
tellraw @a [{"text":"First place: ","color":"gold","bold":true},{"selector":"@a[tag=pod_1]"}]
title @a times 10 75 10
title @a title {"text":"FIRST PLACE!","color":"gold","bold":true}
title @a subtitle {"selector":"@a[tag=pod_1]"}
execute at @n[type=minecraft:marker,tag=podium_gold] run summon minecraft:firework_rocket ~-1 ~3 ~ {LifeTime:25}
execute at @n[type=minecraft:marker,tag=podium_gold] run summon minecraft:firework_rocket ~ ~4 ~ {LifeTime:30}
execute at @n[type=minecraft:marker,tag=podium_gold] run summon minecraft:firework_rocket ~1 ~3 ~ {LifeTime:35}
scoreboard players set #cer_timer round 120
