# Step the cer_walk helper marker towards its target offset, one literal caret hop at a
# time, then hand back to the caller. Called by ceremony/_seat_apply.
#
# Literal carets are used (never macros), because teleport coordinates reject macro tokens.
# The marker is rotated with the audience marker, so ^1 is sideways and ^ ^ ^-1 is backwards.

# Both offsets reached zero: the seat is found
execute if score #walk_l round matches 0 if score #walk_f round matches 0 run return fail

# Step right (positive left) or left (negative left) one block
execute as @e[type=minecraft:marker,tag=cer_walk] if score #walk_l round matches 1.. at @s run tp @s ^1 ^ ^
execute as @e[type=minecraft:marker,tag=cer_walk] if score #walk_l round matches ..-1 at @s run tp @s ^-1 ^ ^
execute if score #walk_l round matches 1.. run scoreboard players remove #walk_l round 1
execute if score #walk_l round matches ..-1 run scoreboard players add #walk_l round 1

# Step backwards one block (fwd is negative = away from the podium)
execute as @e[type=minecraft:marker,tag=cer_walk] if score #walk_f round matches ..-1 at @s run tp @s ^ ^ ^-1
execute if score #walk_f round matches ..-1 run scoreboard players add #walk_f round 1

# Bounded recursion (the crowd layout never needs more than ~64 hops per seat)
scoreboard players add #walk_guard round 1
execute if score #walk_guard round matches ..64 run function hideseek:ceremony/_walk
