tag @a remove pod_1
tag @a remove pod_2
tag @a remove pod_3
tag @a remove pod_audience

execute as @a[tag=joined] run scoreboard players operation @s rank = @s points

# 1st place = highest points
scoreboard players set #pod_best round -2147483648
scoreboard players operation #pod_best round > @a[tag=joined] rank
execute as @a[tag=joined] if score @s rank = #pod_best round run tag @s add pod_1

# 2nd place = highest points among those not already first
scoreboard players set #pod_best round -2147483648
scoreboard players operation #pod_best round > @a[tag=joined,tag=!pod_1] rank
execute as @a[tag=joined,tag=!pod_1] if score @s rank = #pod_best round run tag @s add pod_2

# 3rd place = highest points among those not already placed
scoreboard players set #pod_best round -2147483648
scoreboard players operation #pod_best round > @a[tag=joined,tag=!pod_1,tag=!pod_2] rank
execute as @a[tag=joined,tag=!pod_1,tag=!pod_2] if score @s rank = #pod_best round run tag @s add pod_3

# Everybody else joins the crowd
tag @a[tag=joined,tag=!pod_1,tag=!pod_2,tag=!pod_3] add pod_audience

# Crowd size, so ceremony/info and ceremony/start can report/seat the right number
scoreboard players set #cer_n round 0
execute as @a[tag=pod_audience] run scoreboard players add #cer_n round 1
