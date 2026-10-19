# Hide every lobby label (command-block / public mode). Rounds are then started with
# /function hideseek:game/start_force (or the menu).
scoreboard players set #ui round 0
execute if entity @s run tellraw @s {"text":"Lobby buttons hidden. Start rounds with /function hideseek:game/start_force.","color":"gold"}
