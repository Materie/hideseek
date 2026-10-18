execute unless score #state round matches 0 run return run tellraw @p {"text":"Can't change settings during a round.","color":"yellow"}
scoreboard players set #rotation round 0
tellraw @a {"text":"Seeker rotation: OFF (fully random each round).","color":"gray"}
