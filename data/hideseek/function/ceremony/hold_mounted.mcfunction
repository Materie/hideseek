# A tied winner stays on their own invisible stand. If they press Sneak to get
# off, put them back on the same stand on the next tick.
tag @s add cer_current
tag @s remove cer_has_vehicle
execute on vehicle if entity @s[tag=cer_mount] run tag @a[tag=cer_current,limit=1] add cer_has_vehicle
execute unless entity @s[tag=cer_has_vehicle] run function hideseek:ceremony/remount_player
tag @s remove cer_has_vehicle
tag @s remove cer_current
