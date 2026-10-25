# Arrange the crowd in a U facing the podium.
#
# Three straight runs, drawn in the audience marker's frame:
#   - a front row across the middle, in front of the podium
#   - a left arm and a right arm running back from the ends of the front row
#   - any overflow fills extra rows behind the front row
#
# Seats are filled front row first, so a small crowd gathers in the middle of the U and the
# arms only fill up as more people arrive. Sizes come from ceremony/set_shape.
#
# Requires podium_silver (podium centre) and podium_audience (front-row centre).
execute unless entity @n[type=minecraft:marker,tag=podium_silver] run tellraw @a {"text":"No podium marker: set one with /function hideseek:ceremony/set_silver (or set_all).","color":"yellow"}
execute unless entity @n[type=minecraft:marker,tag=podium_silver] run return fail
execute unless entity @n[type=minecraft:marker,tag=podium_audience] run tellraw @a {"text":"No audience marker: set one with /function hideseek:ceremony/set_audience (or set_all).","color":"yellow"}
execute unless entity @n[type=minecraft:marker,tag=podium_audience] run return fail

# Point the audience marker at the podium: the seat placer uses ^ local coordinates in this
# marker's frame, so its facing decides which way the U opens.
execute as @n[type=minecraft:marker,tag=podium_audience] run tp @s ~ ~ ~ facing entity @n[type=minecraft:marker,tag=podium_silver]

scoreboard players set #cer_n round 0
tag @a remove cer_seated
execute as @a[tag=pod_audience] run scoreboard players add #cer_n round 1
execute if score #cer_n round matches 0 run tellraw @a {"text":"Nobody is in the crowd (everyone placed on the podium).","color":"gray"}
execute if score #cer_n round matches 0 run return fail

scoreboard players set #cer_i round 0
function hideseek:ceremony/_seats
