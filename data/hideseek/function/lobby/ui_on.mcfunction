# Show the lobby labels again.
scoreboard players set #ui round 1
execute if entity @s run tellraw @s {"text":"Lobby buttons shown.","color":"gold"}
