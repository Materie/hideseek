# A player may only start the round if they are part of the game.
execute unless entity @s[tag=joined] run tellraw @s {"text":"Join the game first (press [ Join ] or run /trigger hs_join).","color":"yellow"}
execute unless entity @s[tag=joined] run return fail

function hideseek:game/try_start
