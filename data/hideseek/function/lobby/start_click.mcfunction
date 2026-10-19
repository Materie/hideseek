# A player may only start the round if they are part of the game.
execute if entity @s[tag=joined] run return run function hideseek:game/try_start
tellraw @s {"text":"Join the game first (press [ Join ] or run /trigger hs_join).","color":"yellow"}
