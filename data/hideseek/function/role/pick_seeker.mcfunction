# Find the lowest seeks count among the joined players
scoreboard players set #min round 2147483647
scoreboard players operation #min round < @a[tag=joined] seeks
# Tag everyone tied at that minimum, then pick one at random
execute as @a[tag=joined] if score @s seeks = #min round run tag @s add least_seeks
tag @r[tag=least_seeks] add seeker
tag @a remove least_seeks
