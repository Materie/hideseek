scoreboard players set #cer_phase round 2
execute unless entity @a[tag=pod_2] run return run function hideseek:ceremony/reveal_gold

execute at @n[type=minecraft:marker,tag=podium_silver] run summon minecraft:marker ~ ~ ~ {Tags:["cer_stack"],tags:["cer_stack"]}
execute store result score #cer_ties round if entity @a[tag=pod_2]
execute if score #cer_ties round matches 1 as @a[tag=pod_2] run function hideseek:ceremony/place_one
execute if score #cer_ties round matches 2.. as @a[tag=pod_2] run function hideseek:ceremony/place_tied
kill @e[type=minecraft:marker,tag=cer_stack]
tellraw @a [{"text":"Second place: ","color":"gray","bold":true},{"selector":"@a[tag=pod_2]"}]
title @a times 10 55 10
title @a title {"text":"SECOND PLACE","color":"gray"}
title @a subtitle {"selector":"@a[tag=pod_2]"}
execute at @n[type=minecraft:marker,tag=podium_silver] run summon minecraft:firework_rocket ~ ~3 ~ {LifeTime:25}
scoreboard players set #cer_timer round 80
