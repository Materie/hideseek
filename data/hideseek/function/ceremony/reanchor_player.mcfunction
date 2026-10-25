# Called as/at a player just placed on the podium; move their lock to the new spot.
scoreboard players operation #cer_hold round = @s cer_id
execute as @e[type=minecraft:marker,tag=cer_anchor] if score @s cer_id = #cer_hold round run tp @s ~ ~ ~
