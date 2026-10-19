# Non-toggling join - the [ Join ] button always joins, never leaves.
execute if entity @s[tag=joined] run return run tellraw @s {"text":"You are already in the game.","color":"yellow"}

tag @s add joined
execute store result score #joined round if entity @a[tag=joined]
execute if score #state round matches 1..3 run gamemode spectator @s
execute if score #state round matches ..0 run gamemode survival @s
execute if entity @n[type=minecraft:marker,tag=spawn_staging] run tp @s @n[type=minecraft:marker,tag=spawn_staging]
execute if score #state round matches 1..3 run return run tellraw @s {"text":"You joined! You'll play starting next round.","color":"green"}
tellraw @a [{"selector":"@s"},{"text":" joined the game. ","color":"green"},{"text":"(","color":"gray"},{"score":{"name":"#joined","objective":"round"}},{"text":" joined)","color":"gray"}]
