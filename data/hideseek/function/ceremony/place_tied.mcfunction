# Called as one winner when several players share this medal. Players cannot be
# vehicles in Java Edition, so give each winner an invisible stationary armor
# stand at this podium X/Z and mount them on it. Raise the next stand by 1.5.
function hideseek:ceremony/unmount_player
execute at @n[type=minecraft:marker,tag=cer_stack] run tp @s ~ ~ ~
tag @s remove pod_audience
execute at @s run function hideseek:ceremony/reanchor_player
execute at @s run function hideseek:ceremony/mount_player
execute as @n[type=minecraft:marker,tag=cer_stack] at @s run tp @s ~ ~1.5 ~
