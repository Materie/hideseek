# Called as one winner, after the appropriate podium marker was copied to cer_stack.
# Subsequent tied winners are raised 1.5 blocks at the same X/Z, like a human tower.
function hideseek:ceremony/unmount_player
execute at @n[type=minecraft:marker,tag=cer_stack] run tp @s ~ ~ ~ ~ ~
execute at @s facing entity @n[type=minecraft:marker,tag=podium_audience] feet run tp @s ~ ~ ~ ~ ~
tag @s remove pod_audience
execute at @s run function hideseek:ceremony/reanchor_player
execute at @s run function hideseek:ceremony/mount_player
execute as @n[type=minecraft:marker,tag=cer_stack] at @s run tp @s ~ ~1.5 ~
