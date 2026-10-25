# Operator/command-block force join. Unlike a self-join, bring the player to
# staging; preserve their gamemode through the normal join function first.
execute if score #ceremony_active round matches 1 run return fail
execute unless score #state round matches 0 run return fail
execute at @s unless dimension minecraft:overworld unless dimension minecraft:the_nether unless dimension minecraft:the_end run return run tellraw @s {"text":"Force join cannot save a return point in this dimension.","color":"yellow"}
execute in minecraft:overworld unless entity @n[type=minecraft:marker,tag=spawn_staging] run return fail
execute unless entity @s[tag=hs_home_saved] run function hideseek:lobby/save_home
execute unless entity @s[tag=joined] run function hideseek:lobby/join
execute in minecraft:overworld at @n[type=minecraft:marker,tag=spawn_staging] run tp @s ~ ~ ~ ~ ~
