execute store result score #joined round if entity @a[tag=joined]

tellraw @s [{"text":" ","color":"white"}]
tellraw @s [{"text":"=== Hide & Seek ===","color":"gold","bold":true}]
tellraw @s [{"text":"Joined: ","color":"gray"},{"score":{"name":"#joined","objective":"round"}},{"text":"  Dummies: ","color":"gray"},{"score":{"name":"#dummies","objective":"round"}},{"text":"  Auto-start: ","color":"gray"},{"score":{"name":"#auto_start","objective":"round"}},{"text":"  Rounds/player: ","color":"gray"},{"score":{"name":"#rotations","objective":"round"}}]
execute if entity @s[tag=joined] run tellraw @s [{"text":"[ Start Round ]","color":"green","click_event":{"action":"run_command","command":"/trigger hs_menu set 10"},"hover_event":{"action":"show_text","value":"Start the next round"}}]
scoreboard players set #menu_dummy round 0
execute if score #setup round matches 1 run scoreboard players set #menu_dummy round 1
execute unless score #ui round matches 1 run scoreboard players set #menu_dummy round 1
execute if score #menu_dummy round matches 1 run tellraw @s [{"text":"[ + Dummy ]","color":"aqua","click_event":{"action":"run_command","command":"/trigger hs_menu set 11"},"hover_event":{"action":"show_text","value":"Add a dummy hider"}}]
execute if score #menu_dummy round matches 1 run tellraw @s [{"text":"[ - Dummy ]","color":"aqua","click_event":{"action":"run_command","command":"/trigger hs_menu set 12"},"hover_event":{"action":"show_text","value":"Remove a dummy hider"}}]
execute if entity @s[tag=joined] run tellraw @s [{"text":"[ Leave Game ]","color":"red","click_event":{"action":"run_command","command":"/trigger hs_menu set 20"},"hover_event":{"action":"show_text","value":"Leave the roster"}}]
execute unless entity @s[tag=joined] run tellraw @s [{"text":"[ Join & Travel ]","color":"green","click_event":{"action":"run_command","command":"/trigger hs_menu set 17"},"hover_event":{"action":"show_text","value":"Save your location and travel to staging"}}]
tellraw @s [{"text":"[ Toggle Auto-start ]","color":"yellow","click_event":{"action":"run_command","command":"/trigger hs_menu set 13"},"hover_event":{"action":"show_text","value":"Start the next round automatically"}}]
tellraw @s [{"text":"[ Toggle Setup Mode ]","color":"aqua","click_event":{"action":"run_command","command":"/trigger hs_menu set 21"},"hover_event":{"action":"show_text","value":"Show or hide the dummy controls (operator setup)"}}]
tellraw @s [{"text":"[ Toggle Lobby Labels ]","color":"aqua","click_event":{"action":"run_command","command":"/trigger hs_menu set 22"},"hover_event":{"action":"show_text","value":"Show or hide the on-screen lobby buttons"}}]
tellraw @s [{"text":"[ Game Info ]","color":"white","click_event":{"action":"run_command","command":"/trigger hs_menu set 16"},"hover_event":{"action":"show_text","value":"Show the current settings"}}]
tellraw @s [{"text":"[ Ceremony ]","color":"gold","click_event":{"action":"run_command","command":"/trigger hs_menu set 18"},"hover_event":{"action":"show_text","value":"Crown the top three and seat the crowd"}}]
tellraw @s [{"text":"[ Standings ]","color":"gold","click_event":{"action":"run_command","command":"/trigger hs_menu set 19"},"hover_event":{"action":"show_text","value":"Show who is on each medal"}}]
tellraw @s [{"text":"[ End Game ]","color":"dark_red","click_event":{"action":"run_command","command":"/trigger hs_menu set 14"},"hover_event":{"action":"show_text","value":"End the game session"}}]
tellraw @s [{"text":"[ Reset Scores ]","color":"dark_red","click_event":{"action":"run_command","command":"/trigger hs_menu set 15"},"hover_event":{"action":"show_text","value":"Wipe points and seeker counts"}}]
