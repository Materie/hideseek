scoreboard players operation #cer_hold round = @s cer_id
ride @s dismount
execute as @e[type=minecraft:armor_stand,tag=cer_mount] if score @s cer_id = #cer_hold round run ride @a[tag=cer_current,limit=1] mount @s
