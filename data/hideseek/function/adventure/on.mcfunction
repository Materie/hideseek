execute unless score #state round matches 0 run return run tellraw @p {"text":"Can't change settings during a round.","color":"yellow"}
scoreboard players set #adventure round 1
tellraw @a {"text":"Adventure mode: ON for the next round.","color":"gray"}