# Force-start (op only): bring everyone online to staging, then start.
execute if score #ceremony_active round matches 1 run return fail
execute unless score #state round matches 0 run return fail
execute as @a run function hideseek:lobby/force_join
tellraw @a {"text":"Force-start: everyone online has been added to the game.","color":"gold"}
function hideseek:game/try_start
