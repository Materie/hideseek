execute unless score #state round matches 0 run return run tellraw @s {"text":"Can't reset scores during a round.","color":"yellow"}

scoreboard players reset * points
scoreboard players reset * seeks
scoreboard players set #dummies round 0

tellraw @a {"text":"Scores reset.","color":"gray"}