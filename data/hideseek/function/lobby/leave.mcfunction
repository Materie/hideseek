# Active participants can't bail mid-round
execute if score #ceremony_active round matches 1 run return run tellraw @s {"text":"Wait until the trophy ceremony ends before leaving.","color":"yellow"}
execute unless entity @s[tag=joined] run return fail
execute if score #state round matches 1..3 if entity @s[tag=hider] run return run tellraw @s {"text":"You can't leave during an active round.","color":"yellow"}
execute if score #state round matches 1..3 if entity @s[tag=seeker] run return run tellraw @s {"text":"You can't leave during an active round.","color":"yellow"}

execute if score #state round matches 1..3 run function hideseek:lobby/restore_gamemode
execute if entity @s[tag=hs_home_saved] run function hideseek:lobby/return_home
scoreboard players reset @s gm_prev
tag @s remove joined
execute store result score #joined round if entity @a[tag=joined]
tellraw @a [{"selector":"@s"},{"text":" left the game. ","color":"gray"},{"text":"(","color":"gray"},{"score":{"name":"#joined","objective":"round"}},{"text":" joined)","color":"gray"}]
