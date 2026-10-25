# Self-test / walkthrough: run /function hideseek:debug/selftest
# Checks the pieces that silently break everything if they fail to load, and prints the
# exact steps to start a game. Nothing here changes game state.
#
# Uses `say` for status: tellraw/title never reach the server log, and `say` does.
# A function that failed to load is silently missing, so the checks below are written as
# plain commands that will only run if THIS file loaded. If you see the banner but some
# state looks wrong, scroll the log for "Failed to load function hideseek:".

say [hideseek selftest] running

# Config / state dump (scores read through the sidebar, which is visible in the log via say)
execute store result score #dbg_tmp round run scoreboard players get #state round
say [hideseek selftest] see the tellraw output for state, ui, setup, rotations, dummies

# Button set completeness, reported into scores so it can be read from the sidebar
scoreboard players set #dbg_l round 0
scoreboard players set #dbg_i round 0
execute if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] as @e[type=minecraft:text_display,distance=..6] run scoreboard players add #dbg_l round 1
execute if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] as @e[type=minecraft:interaction,distance=..6] run scoreboard players add #dbg_i round 1

# Emit the counts as readable log lines (one `say` per value - `say` has no score component).
execute if score #dbg_l round matches 4 run say [hideseek selftest] labels 4/4 OK
execute unless score #dbg_l round matches 4 run say [hideseek selftest] labels NOT 4 - lobby/setup did not run
execute if score #dbg_i round matches 4 run say [hideseek selftest] interactions 4/4 OK
execute unless score #dbg_i round matches 4 run say [hideseek selftest] interactions NOT 4 - lobby/setup did not run
execute unless entity @n[type=minecraft:marker,tag=spawn_staging] run say [hideseek selftest] NO staging marker - run /function hideseek:spawn/setup

# Ceremony anchors (optional - needed only for the trophy ceremony)
execute if entity @n[type=minecraft:marker,tag=podium_silver] run say [hideseek selftest] ceremony podium (silver) marker OK
execute unless entity @n[type=minecraft:marker,tag=podium_silver] run say [hideseek selftest] ceremony podium marker MISSING - run /function hideseek:ceremony/set_all
execute if entity @n[type=minecraft:marker,tag=podium_audience] run say [hideseek selftest] ceremony audience marker OK
execute unless entity @n[type=minecraft:marker,tag=podium_audience] run say [hideseek selftest] ceremony audience marker MISSING - run /function hideseek:ceremony/set_all

# Useful state lines
execute if score #ui round matches 1 run say [hideseek selftest] ui=1 (labels shown)
execute unless score #ui round matches 1 run say [hideseek selftest] ui=0 (labels hidden / command-block mode)
execute if score #setup round matches 1 run say [hideseek selftest] setup=1 (dummy controls usable)
execute unless score #setup round matches 1 run say [hideseek selftest] setup=0 (dummy controls OFF - enable with /function hideseek:lobby/setup_on)
execute if score #state round matches 0 run say [hideseek selftest] state=0 (idle)
execute unless score #state round matches 0 run say [hideseek selftest] state is mid-round

# Gamemode memory: every joined player records gm_prev on join, so the pack can put them
# back the way they were when the round ends.
execute unless entity @a[tag=joined] run say [hideseek selftest] nobody is on the roster yet - gm_prev is captured when a player joins
execute if entity @a[tag=joined] run say [hideseek selftest] roster has players - their gamemode is remembered in gm_prev

tellraw @s [{"text":"--- Hide & Seek self-test ---","color":"gold","bold":true}]
tellraw @s [{"text":"Key state (also confirmed in the server log):","color":"gray"}]
tellraw @s [{"text":"  state: ","color":"gray"},{"score":{"name":"#state","objective":"round"}},{"text":"  ui: ","color":"gray"},{"score":{"name":"#ui","objective":"round"}},{"text":"  setup: ","color":"gray"},{"score":{"name":"#setup","objective":"round"}},{"text":"  rotations: ","color":"gray"},{"score":{"name":"#rotations","objective":"round"}}]
tellraw @s [{"text":"  labels: ","color":"gray"},{"score":{"name":"#dbg_l","objective":"round"}},{"text":"/4  interactions: ","color":"gray"},{"score":{"name":"#dbg_i","objective":"round"}},{"text":"/4 (both must be 4)","color":"gray"}]
tellraw @s [{"text":"To play:","color":"gold"}]
tellraw @s [{"text":"  1. Operator: /function hideseek:lobby/setup_on (or menu -> Toggle Setup Mode) to enable dummy buttons.","color":"gray"}]
tellraw @s [{"text":"  2. Add a dummy with [ + Dummy ] (setup mode must be ON), or have a second player join.","color":"gray"}]
tellraw @s [{"text":"  3. Press the physical [ Join ] to stay here, or /trigger hs_join to save your location and travel to staging.","color":"gray"}]
tellraw @s [{"text":"  4. Once [ Need 2 ] becomes [ Start Round ], press it. The Join button becomes Leave when everyone is joined.","color":"gray"}]
tellraw @s [{"text":"Command block / console: ``function hideseek:game/try_start`` auto-joins everyone online and force-starts.","color":"gray"}]
tellraw @s [{"text":"Confirm all functions loaded: the log must NOT contain 'Failed to load function hideseek:...'.","color":"yellow"}]
