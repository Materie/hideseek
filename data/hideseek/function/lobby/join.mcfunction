# Local self-join from the physical button: add to the roster in place.
execute if score #ceremony_active round matches 1 run return run tellraw @s {"text":"Wait until the trophy ceremony ends before changing the roster.","color":"yellow"}
execute if entity @s[tag=joined] run return run tellraw @s {"text":"You are already in the game.","color":"yellow"}

# Remember a late joiner's mode before putting them into spectator. For players
# joining in the lobby, the first round refreshes this snapshot at match start.
function hideseek:lobby/save_gamemode

tag @s add joined
execute store result score #joined round if entity @a[tag=joined]
execute if score #state round matches 1..3 run gamemode spectator @s
execute if score #state round matches 1..3 run tellraw @s {"text":"You joined! You'll play starting next round.","color":"green"}
tellraw @a [{"selector":"@s"},{"text":" joined the game. ","color":"green"},{"text":"(","color":"gray"},{"score":{"name":"#joined","objective":"round"}},{"text":" joined)","color":"gray"}]
execute if score #state round matches 0 if score #joined round matches 1 if score #dummies round matches 0 run tellraw @s {"text":"Need one more participant to start: another player can join, or an operator can run /function hideseek:lobby/setup_on then press [ + Dummy ].","color":"yellow"}
