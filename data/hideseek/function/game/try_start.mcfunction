execute unless score #state round matches 0 run return run tellraw @p {"text":"A round is already in progress.","color":"yellow"}

# Count real players plus dummies
execute store result score #players round if entity @a
scoreboard players operation #players round += #dummies round
execute if score #players round matches ..1 run return run tellraw @p {"text":"Need at least 2 players. Add dummies with the dummy buttons.","color":"yellow"}

# Starting after end_game begins a new game session
execute if score #active round matches 0 run function hideseek:game/on

function hideseek:game/start_round