# Operator-only entry point (not routed through a player trigger).
# The clickable command is /trigger, so invited non-operators can accept it.
scoreboard players enable @a hs_join
tellraw @a [{"text":"Hide & Seek invitation! ","color":"gold","bold":true},{"text":"[ Join the game ]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger hs_join set 1"},"hover_event":{"action":"show_text","value":"Save your location and travel to the Hide & Seek lobby"}},{"text":"  Click to travel to staging; you'll return here when the session ends.","color":"gray"}]
