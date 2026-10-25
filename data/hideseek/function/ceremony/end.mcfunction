# Automatically called after the gold reveal; operators may call it early.
execute unless score #ceremony_active round matches 1 run return fail
scoreboard players set #ceremony_active round 0
execute as @a[tag=cer_mounted] run ride @s dismount
tag @a remove cer_mounted
tag @a remove cer_has_vehicle
kill @e[type=minecraft:armor_stand,tag=cer_mount]
tag @a remove cer_frozen
tag @a remove cer_current
kill @e[type=minecraft:marker,tag=cer_anchor]
kill @e[type=minecraft:marker,tag=cer_stack]
scoreboard players reset * cer_id
tag @a remove pod_1
tag @a remove pod_2
tag @a remove pod_3
tag @a remove pod_audience
tag @a remove cer_seated
scoreboard players reset * rank

execute at @n[type=minecraft:marker,tag=spawn_staging] run tp @a[tag=joined] ~ ~ ~ ~ ~
function hideseek:lobby/restore_all_gamemodes
execute as @a[tag=hs_home_saved] run function hideseek:lobby/return_home
execute if score #ceremony_session round matches 1 run function hideseek:game/reset_scores
scoreboard players set #ceremony_session round 0
scoreboard players set #active round 0
scoreboard players set #intermission round -1
bossbar set hideseek:timer players
title @a title {"text":"Ceremony over","color":"gold"}
