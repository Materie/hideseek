# Command block / console (no player executor): treat it as a force-start.
# This keeps a redstone-driven setup working without anyone typing /trigger hs_join.
execute unless entity @s run tag @a add joined

execute unless score #state round matches 0 run return run execute if entity @s run tellraw @s {"text":"A round is already in progress.","color":"yellow"}

# Nobody on the roster yet: dummies alone must not start a round
execute store result score #joined_n round if entity @a[tag=joined]
execute if score #joined_n round matches ..0 run return run execute if entity @s run tellraw @s {"text":"Nobody has joined the roster yet. Run /trigger hs_join to join.","color":"yellow"}

# Count joined players plus dummies
execute store result score #players round if entity @a[tag=joined]
scoreboard players operation #players round += #dummies round
execute if score #players round matches ..1 run return run execute if entity @s run tellraw @s {"text":"Need at least 2 players (joined + dummies). Press [ Join ] or add dummies.","color":"yellow"}

# Starting after end_game begins a new game session
execute if score #active round matches 0 run function hideseek:game/on

function hideseek:game/start_round
