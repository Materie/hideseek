# Start the round, refusing politely if the lobby isn't ready.
#
# Called by the [ Start Round ] button (as the clicking player) and by command blocks /
# console. A command block or the console has no player as the executor, so treat that as a
# force-start: everyone online is added to the roster so a redstone rig works with no typing.
# Keep a completed session's standings and podium intact until ceremony/end.
execute if score #ceremony_active round matches 1 run tellraw @a {"text":"The trophy ceremony is in progress. Run /function hideseek:ceremony/end before starting another match.","color":"yellow"}
execute if score #ceremony_active round matches 1 run return fail

# Only from the lobby
execute unless score #state round matches 0 run tellraw @a {"text":"A round is already in progress.","color":"yellow"}
execute unless score #state round matches 0 run return fail
execute unless entity @s as @a run function hideseek:lobby/force_join

# Dummies alone must not start a round
execute store result score #joined_n round if entity @a[tag=joined]
execute if score #joined_n round matches ..0 run tellraw @a {"text":"Nobody has joined the roster yet. Run /trigger hs_join to join.","color":"yellow"}
execute if score #joined_n round matches ..0 run return fail

# Joined players plus dummies must be at least 2
execute store result score #players round if entity @a[tag=joined]
scoreboard players operation #players round += #dummies round
execute if score #players round matches ..1 run tellraw @a {"text":"Need at least 2 participants (joined + dummies). Press [ Join ] or add dummies.","color":"yellow"}
execute if score #players round matches ..1 run return fail

# Starting after end_game begins a new game session
execute if score #active round matches 0 run function hideseek:game/on

function hideseek:game/start_round
