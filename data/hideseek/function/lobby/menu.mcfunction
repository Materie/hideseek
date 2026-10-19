execute store result score #joined round if entity @a[tag=joined]

tellraw @s [{"text":" ","color":"white"}]
tellraw @s [{"text":"=== Hide & Seek ===","color":"gold","bold":true}]
tellraw @s [{"text":"Joined: ","color":"gray"},{"score":{"name":"#joined","objective":"round"}},{"text":"  Dummies: ","color":"gray"},{"score":{"name":"#dummies","objective":"round"}},{"text":"  Auto-start: ","color":"gray"},{"score":{"name":"#auto_start","objective":"round"}},{"text":"  Rounds/player: ","color":"gray"},{"score":{"name":"#rotations","objective":"round"}}]
execute if entity @s[tag=joined] run tellraw @s [{"text":"[ Start Round ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 10"},"hoverEvent":{"action":"show_text","text":"Start the next round"}}]
scoreboard players set #menu_dummy round 0
execute if score #setup round matches 1 run scoreboard players set #menu_dummy round 1
execute unless score #ui round matches 1 run scoreboard players set #menu_dummy round 1
execute if score #menu_dummy round matches 1 run tellraw @s [{"text":"[ + Dummy ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 11"},"hoverEvent":{"action":"show_text","text":"Add a dummy hider"}}]
execute if score #menu_dummy round matches 1 run tellraw @s [{"text":"[ - Dummy ]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 12"},"hoverEvent":{"action":"show_text","text":"Remove a dummy hider"}}]
execute if entity @s[tag=joined] run tellraw @s [{"text":"[ Leave Game ]","color":"red","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 17"},"hoverEvent":{"action":"show_text","text":"Leave the roster"}}]
execute unless entity @s[tag=joined] run tellraw @s [{"text":"[ Join Game ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 17"},"hoverEvent":{"action":"show_text","text":"Join the roster"}}]
tellraw @s [{"text":"[ Toggle Auto-start ]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 13"},"hoverEvent":{"action":"show_text","text":"Start the next round automatically"}}]
tellraw @s [{"text":"[ Game Info ]","color":"white","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 16"},"hoverEvent":{"action":"show_text","text":"Show the current settings"}}]
tellraw @s [{"text":"[ End Game ]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 14"},"hoverEvent":{"action":"show_text","text":"End the game session"}}]
tellraw @s [{"text":"[ Reset Scores ]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger hs_menu set 15"},"hoverEvent":{"action":"show_text","text":"Wipe points and seeker counts"}}]
