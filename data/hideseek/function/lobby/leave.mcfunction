# Active participants can't bail mid-round
execute if score #state round matches 1..3 if entity @s[tag=hider] run return run tellraw @s {"text":"You can't leave during an active round.","color":"yellow"}
execute if score #state round matches 1..3 if entity @s[tag=seeker] run return run tellraw @s {"text":"You can't leave during an active round.","color":"yellow"}

tag @s remove joined
execute store result score #joined round if entity @a[tag=joined]
tellraw @a [{"selector":"@s"},{"text":" left the game. ","color":"gray"},{"text":"(","color":"gray"},{"score":{"name":"#joined","objective":"round"}},{"text":" joined)","color":"gray"}]
