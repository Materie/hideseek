# Stand the winners on their marks and turn them to face the crowd.
#
# The marker is the origin of each teleport (`execute at <marker> ... run tp @s ~ ~ ~`), so
# the destination is exact. A bare `@n[...]` has no position to sort from - without an `at`
# it sorts from the world origin and finds nothing - which is what stopped the winners from
# actually being moved.
#
# No gamemode is forced here: the round lifecycle already decides survival/adventure, and
# putting winners into spectator would take an operator out of creative.
execute at @n[type=minecraft:marker,tag=podium_gold] as @a[tag=pod_1] run tp @s ~ ~ ~ ~ ~
execute at @n[type=minecraft:marker,tag=podium_silver] as @a[tag=pod_2] run tp @s ~ ~ ~ ~ ~
execute at @n[type=minecraft:marker,tag=podium_bronze] as @a[tag=pod_3] run tp @s ~ ~ ~ ~ ~

# Face the crowd
execute at @n[type=minecraft:marker,tag=podium_audience] as @a[tag=pod_1] run tp @s ~ ~ ~ facing entity @n[type=minecraft:marker,tag=podium_audience]
execute at @n[type=minecraft:marker,tag=podium_audience] as @a[tag=pod_2] run tp @s ~ ~ ~ facing entity @n[type=minecraft:marker,tag=podium_audience]
execute at @n[type=minecraft:marker,tag=podium_audience] as @a[tag=pod_3] run tp @s ~ ~ ~ facing entity @n[type=minecraft:marker,tag=podium_audience]
