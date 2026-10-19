# Re-arm trigger objectives every tick: /trigger is one-shot per enable, and 26.3
# doesn't grant the enable back on login or objective creation, so without this
# every /trigger answers "You cannot trigger this objective yet" after the first use.
scoreboard players enable @a hs_join
scoreboard players enable @a hs_menu

# Roster and menu triggers (work in any state)
execute as @a[scores={hs_join=1..}] run function hideseek:lobby/handle_join
scoreboard players set @a[scores={hs_join=1..}] hs_join 0
execute as @a[scores={hs_menu=1..}] run function hideseek:lobby/handle_menu
scoreboard players set @a[scores={hs_menu=1..}] hs_menu 0

# Lobby buttons: rebuild if the set is incomplete or duplicated.
# Count-based and tag-independent, so stale/broken copies always get cleaned up
# (never spawn a new set every tick - unbounded entity growth kills FPS).
execute if score #state round matches 0 if score #ui round matches 1 if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] run scoreboard players set #btn_count round 0
execute if score #state round matches 0 if score #ui round matches 1 if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] as @e[type=minecraft:text_display,distance=..6] run scoreboard players add #btn_count round 1
execute if score #state round matches 0 if score #ui round matches 1 if entity @n[type=minecraft:marker,tag=spawn_staging] unless score #btn_count round matches 4 run function hideseek:lobby/setup
execute if score #state round matches 0 if score #ui round matches 1 if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] run scoreboard players set #icount round 0
execute if score #state round matches 0 if score #ui round matches 1 if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] as @e[type=minecraft:interaction,distance=..6] run scoreboard players add #icount round 1
execute if score #state round matches 0 if score #ui round matches 1 if entity @n[type=minecraft:marker,tag=spawn_staging] unless score #icount round matches 4 run function hideseek:lobby/setup

# Conditional labels (also refreshed mid-round, so setup mode hides them immediately)
execute if score #ui round matches 1 run function hideseek:lobby/refresh
execute if score #state round matches 0 if score #ui round matches 1 run function hideseek:lobby/buttons

# UI disabled: remove any leftover button set (once)
execute if score #ui round matches 0 if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] if entity @e[type=minecraft:interaction,distance=..6] run function hideseek:lobby/clear_buttons

# Session complete (rotation cap reached): end it by itself, like the End button
execute if score #state round matches 0 if score #active round matches 1 if score #session_round round >= #session_max round run function hideseek:game/session_end

# Auto-start: (re)load the intermission countdown when idle
execute if score #state round matches 0 if score #active round matches 1 if score #session_round round < #session_max round if score #auto_start round matches 1 if score #intermission round matches ..-1 run scoreboard players operation #intermission round = #intermission_time round
execute if score #state round matches 0 if score #intermission round matches 1.. run scoreboard players remove #intermission round 1

# Actionbar countdown, rounded up, once per second
execute if score #state round matches 0 if score #intermission round matches 1.. run scoreboard players operation #secs round = #intermission round
execute if score #state round matches 0 if score #intermission round matches 1.. run scoreboard players add #secs round 19
execute if score #state round matches 0 if score #intermission round matches 1.. run scoreboard players operation #secs round /= #20 round
execute if score #state round matches 0 if score #intermission round matches 1.. run scoreboard players operation #tmp round = #intermission round
execute if score #state round matches 0 if score #intermission round matches 1.. run scoreboard players operation #tmp round %= #20 round
execute if score #state round matches 0 if score #intermission round matches 1.. if score #tmp round matches 0 run title @a[tag=joined] actionbar [{"text":"Next round starting in ","color":"aqua"},{"score":{"name":"#secs","objective":"round"}},{"text":"s...","color":"aqua"}]

# Intermission over: start the round (as a joined player so status messages land somewhere)
execute if score #state round matches 0 if score #intermission round matches 0 run execute as @r[tag=joined] run function hideseek:game/try_start
execute if score #state round matches 0 if score #intermission round matches 0 run scoreboard players set #intermission round -1
# If the start was refused (too few players), try again after another intermission
execute if score #state round matches 0 if score #intermission round matches -1 if score #active round matches 1 if score #auto_start round matches 1 if score #session_round round < #session_max round run scoreboard players operation #intermission round = #intermission_time round
