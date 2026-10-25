scoreboard players set @s known 1

# Only roster players returning mid-round spectate. New visitors remain where
# they are until they choose the local button or accept a remote invitation.
execute if score #state round matches 1..3 if entity @s[tag=joined] run gamemode spectator @s
execute if score #state round matches 1..3 if entity @s[tag=joined] at @n[type=minecraft:marker,tag=spawn_staging] run tp @s ~ ~ ~ ~ ~
execute if score #state round matches 1..3 if entity @s[tag=joined] run tellraw @a [{"selector":"@s"},{"text":" returned mid-round and is spectating.","color":"gray"}]

# Welcome and roster prompt
tellraw @s [{"text":" ","color":"white"},{"text":"[ Join & Travel ]","color":"green","click_event":{"action":"run_command","command":"/trigger hs_join set 1"},"hover_event":{"action":"show_text","value":"Save your position and travel to staging"}},{"text":" or use the physical [ Join ] button to stay in place, or ","color":"gray"},{"text":"[ Game Menu ]","color":"aqua","click_event":{"action":"run_command","command":"/trigger hs_menu set 1"},"hover_event":{"action":"show_text","value":"Opens the game menu"}}]
