scoreboard players set #state round 0
# Restore team defaults so other games in this world aren't affected.
# The normal round end lands here without going through end_game, so restore both ways.
team modify hiders friendlyFire true
team modify seekers friendlyFire true
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
clear @a[tag=joined]
effect clear @a[tag=joined]
function hideseek:lobby/restore_all_gamemodes
team leave @a[tag=joined]
tag @a remove seeker
tag @a remove hider
scoreboard players set #intermission round -1

# Back to staging
execute at @n[type=minecraft:marker,tag=spawn_staging] run tp @a[tag=joined] ~ ~ ~ ~ ~