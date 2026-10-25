# Called as/at a participant. Riding a stationary invisible stand holds their
# position smoothly, without repeated teleport packets or changing their view.
# Keep the existing marker lock as a fallback if mounting fails.
execute at @s run summon minecraft:armor_stand ~ ~-1.25 ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,Tags:["cer_mount","cer_new_mount"],tags:["cer_mount","cer_new_mount"]}
scoreboard players operation @n[type=minecraft:armor_stand,tag=cer_new_mount] cer_id = @s cer_id
execute store success score #cer_ride round run ride @s mount @n[type=minecraft:armor_stand,tag=cer_new_mount]
execute if score #cer_ride round matches 1 run tag @e[type=minecraft:armor_stand,tag=cer_new_mount] remove cer_new_mount
execute if score #cer_ride round matches 1 run tag @s remove cer_frozen
execute if score #cer_ride round matches 1 run tag @s add cer_mounted
execute unless score #cer_ride round matches 1 run kill @e[type=minecraft:armor_stand,tag=cer_new_mount]
