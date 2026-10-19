gamerule spawn_monsters false
scoreboard players set #active round 1
function hideseek:game/clear_hostiles

# Session length: each joined player gets #rotations rounds as seeker (always at
# least one round, so a lone player with dummies still gets exactly one).
execute store result score #session_max round if entity @a[tag=joined]
execute if score #session_max round matches ..0 run scoreboard players set #session_max round 1
scoreboard players operation #session_max round *= #rotations round
scoreboard players set #session_round round 0

tellraw @a {"text":"Game on: hostile mob spawning disabled.","color":"gray"}
