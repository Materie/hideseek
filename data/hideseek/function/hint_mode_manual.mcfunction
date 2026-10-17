execute unless score #state round matches 0 run return run tellraw @p {"text":"Can't change settings during a round.","color":"yellow"}
scoreboard players set #hint_mode round 0
tellraw @a {"text":"Hint mode: MANUAL (seeker uses carrot on a stick, 5 uses per round).","color":"gray"}
