# Called as one frozen player each tick. Find their own anchor by scoreboard id.
# The three-coordinate teleport preserves the player's viewing direction.
scoreboard players operation #cer_hold round = @s cer_id
tag @s add cer_current
execute as @e[type=minecraft:marker,tag=cer_anchor] if score @s cer_id = #cer_hold round at @s run tp @a[tag=cer_current,limit=1] ~ ~ ~
tag @s remove cer_current
