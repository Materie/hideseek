# Move one random unseated spectator onto a seat.
#
# Offsets passed in from ceremony/_seats:
#   left = blocks to the crowd's right (negative = to the left)
#   fwd  = blocks towards the podium (negative = back, away from the podium)
#
# Macros cannot appear inside teleport coordinates in this version (the parser rejects
# `tp @s ^$(left) ^ ^$(fwd)` before the macro is expanded), so the seat is reached by
# walking a helper marker from the audience marker with LITERAL caret hops, one block at a
# time. The helper is summoned at the audience marker, so it inherits its rotation and the
# carets follow the marker's frame. The player is then teleported straight onto the helper.
#
# The chosen player is marked first, so every following command refers to the same person
# (@r called twice would roll a fresh player each time).

tag @r[tag=pod_audience,tag=!cer_seated] add cer_seating

# Helper marker at the audience marker (position + rotation)
kill @e[type=minecraft:marker,tag=cer_walk]
execute at @n[type=minecraft:marker,tag=podium_audience] run summon minecraft:marker ~ ~ ~ {Tags:["cer_walk"],tags:["cer_walk"]}

# Walk counters start at the absolute offsets and are stepped towards zero
scoreboard players operation #walk_l round = #cer_left round
scoreboard players operation #walk_f round = #cer_fwd round
scoreboard players set #walk_guard round 0
function hideseek:ceremony/_walk

# Drop the player on the helper and copy the helper's facing
execute at @e[type=minecraft:marker,tag=cer_walk] rotated as @e[type=minecraft:marker,tag=cer_walk] as @a[tag=cer_seating] run tp @s ~ ~ ~ ~ ~
kill @e[type=minecraft:marker,tag=cer_walk]

tag @a[tag=cer_seating] add cer_seated
tag @a remove cer_seating
