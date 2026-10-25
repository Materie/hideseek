# Put a player back into the gamemode they had before they joined the roster.
#
# Call this as the player (or `as @a[tag=joined]`). The value was captured by lobby/join
# into the `gm_prev` objective:
#   0 survival, 1 creative, 2 adventure, 3 spectator
# Players with no snapshot are left alone; don't overwrite another world's game mode.

execute unless score @s gm_prev matches 0..3 run return fail

execute if score @s gm_prev matches 0 run gamemode survival @s
execute if score @s gm_prev matches 1 run gamemode creative @s
execute if score @s gm_prev matches 2 run gamemode adventure @s
execute if score @s gm_prev matches 3 run gamemode spectator @s
