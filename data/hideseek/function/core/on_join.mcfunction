scoreboard players set @s known 1

# Mid-round arrivals sit out until the next round
execute if score #state round matches 1..3 run gamemode spectator @s
execute if score #state round matches 1..3 if entity @n[type=minecraft:marker,tag=spawn_staging] run tp @s @n[type=minecraft:marker,tag=spawn_staging]
execute if score #state round matches 1..3 run tellraw @a [{"selector":"@s"},{"text":" joined mid-round and is spectating.","color":"gray"}]

# Welcome and roster prompt
tellraw @s [{"text":" ","color":"white"},{"text":"[ Join Game ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger hs_join"},"hoverEvent":{"action":"show_text","text":"Runs /trigger hs_join"}},{"text":" or press the [ Join ] button to play, or ","color":"gray"},{"text":"[ Game Menu ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 1"},"hoverEvent":{"action":"show_text","text":"Opens the game menu"}}]
