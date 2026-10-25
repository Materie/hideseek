# Each player gets a stationary invisible mount; a marker is kept only as a
# fallback if mounting fails. Run after everybody has taken an audience seat.
kill @e[type=minecraft:marker,tag=cer_anchor]
kill @e[type=minecraft:marker,tag=cer_stack]
kill @e[type=minecraft:armor_stand,tag=cer_mount]
tag @a remove cer_frozen
tag @a remove cer_mounted
tag @a remove cer_has_vehicle
scoreboard players set #cer_next round 0
execute as @a[tag=joined] at @s run function hideseek:ceremony/lock_player
