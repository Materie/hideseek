scoreboard players set #state round 0
function hideseek:boundary/off
function hideseek:status/off
kill @e[type=minecraft:husk,tag=dummy_hider]
kill @e[type=minecraft:husk,tag=dc_hider]
kill @e[tag=hider_pos]
scoreboard players reset * dc_state
scoreboard players reset * hid
scoreboard players set #hint_base round 0
scoreboard players set #hint_per_hider round 1
scoreboard players set #hint_cooldown round 0
clear @a
effect clear @a
gamemode survival @a
team leave @a
tag @a remove seeker
tag @a remove hider

# Back to staging
tp @a @n[type=minecraft:marker,tag=spawn_staging]