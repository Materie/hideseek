# At the beginning of a new session, capture lobby modes (including changes made
# after joining). Later rounds reuse these snapshots; late joiners saved theirs on join.
execute if score #session_round round matches 0 as @a[tag=joined] run function hideseek:lobby/save_gamemode
scoreboard players set @a[tag=joined] died 0

# Count this round towards the session, and leave setup mode while playing
scoreboard players add #session_round round 1
scoreboard players set #setup round 0

# Remove any dummies and dc husks left over from the last round
kill @e[type=minecraft:husk,tag=dummy_hider]
kill @e[type=minecraft:husk,tag=dc_hider]
kill @e[tag=hider_pos]
scoreboard players reset * dc_state
scoreboard players reset * hid
scoreboard players set #hid_counter round 0
scoreboard players set #hint_uses round 5
scoreboard players set #hint_cooldown round 0
scoreboard players operation #hint_timer round = #hint_interval round

# Clear last round's roles
tag @a remove seeker
tag @a remove hider

# Pick the seeker: fair rotation (least seeks) when enabled and 2+ joined players, else random
execute store result score #rplayers round if entity @a[tag=joined]
execute if score #rotation round matches 1 if score #rplayers round matches 2.. run function hideseek:role/pick_seeker
execute unless entity @a[tag=seeker] run tag @r[tag=joined] add seeker
scoreboard players add @a[tag=seeker] seeks 1
tag @a[tag=joined,tag=!seeker] add hider
# Snapshot COAS stat so first-tick delta is 0
execute as @a[tag=seeker] run scoreboard players operation @s hint_prev = @s coas_used

# Assign each hider a unique numeric ID and summon their position marker
execute as @a[tag=hider] at @s run function hideseek:role/assign_hid

# Teams
team leave @a
team join seekers @a[tag=seeker]
team join hiders @a[tag=hider]
team modify hiders friendlyFire false
team modify seekers friendlyFire false

# Announce
title @a[tag=seeker] subtitle {"text":"Released after the head start","color":"gray"}
title @a[tag=seeker] title {"text":"You are the SEEKER","color":"red"}
title @a[tag=hider] subtitle {"text":"Stay within the orange boundary!","color":"yellow"}
title @a[tag=hider] title {"text":"You are HIDING","color":"green"}

# Everybody plays in survival (or adventure if selected), not creative/spectator.
gamemode survival @a[tag=joined]
execute if score #adventure round matches 1 run gamemode adventure @a[tag=joined]

# Calculate round length based on the number of hiders (real + dummy) and the per-hider time
execute store result score #hiders round if entity @a[tag=hider]
scoreboard players operation #hiders round += #dummies round

scoreboard players operation #length round = #hiders round
scoreboard players operation #length round *= #per_hider round
scoreboard players operation #length round += #base round

# Calculate summoning rod uses based on the number of hiders (real + dummy) and the per-hider uses
scoreboard players operation #hint_uses round = #hiders round
scoreboard players operation #hint_uses round *= #hint_per_hider round
scoreboard players operation #hint_uses round += #hint_base round

# Kit
execute store result storage hideseek:tmp hint_uses int 1 run scoreboard players get #hint_uses round
function hideseek:role/give_kit with storage hideseek:tmp

# Full heal so nobody starts the round wounded
effect give @a[tag=joined] minecraft:instant_health 1 255 true

# Hiders go to the hider spawn; the seeker waits in staging
execute at @n[type=minecraft:marker,tag=spawn_hider] run tp @a[tag=hider] ~ ~ ~ ~ ~
execute at @n[type=minecraft:marker,tag=spawn_staging] run tp @a[tag=seeker] ~ ~ ~ ~ ~

# Dummy hiders, spread out around the dummy marker
execute if score #dummies round matches 1.. at @n[type=minecraft:marker,tag=spawn_dummy] run function hideseek:dummy/spawn
team join hiders @e[type=minecraft:husk,tag=dummy_hider]

# Prepare boundary data (centre marker + storage) and put the real border live for the whole round
function hideseek:boundary/prep
function hideseek:boundary/on
tellraw @a[tag=hider] [{"text":"Boundary: ","color":"yellow"},{"score":{"name":"#bound_size","objective":"round"}},{"text":" blocks wide. Stay inside the orange wall!","color":"yellow"}]

# Head start: hiders scatter while the seeker waits
scoreboard players operation #head round = #headstart round
# If every hider is a dummy (husks are spread instantly), shrink the head start to a shortened duration
execute unless entity @a[tag=hider] run scoreboard players operation #head round = #headstart_dummy round
execute store result bossbar hideseek:timer max run scoreboard players get #head round
bossbar set hideseek:timer color blue
bossbar set hideseek:timer players @a
scoreboard players set #state round 3
scoreboard players set #intermission round -1
function hideseek:status/on
