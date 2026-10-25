# Release this player's previous audience/podium seat before placing them on
# another one. Leave their fallback marker until the new podium spot is known.
execute if entity @s[tag=cer_mounted] run ride @s dismount
scoreboard players operation #cer_hold round = @s cer_id
execute as @e[type=minecraft:armor_stand,tag=cer_mount] if score @s cer_id = #cer_hold round run kill @s
tag @s remove cer_mounted
tag @s add cer_frozen
