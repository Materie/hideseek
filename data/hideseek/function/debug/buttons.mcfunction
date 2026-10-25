# Lobby button diagnostics - run: /function hideseek:debug/buttons
# What to look for: state = 0, #ui = 1, counts = 4 / 4, Tags lists present (blank = missing
# or untagged entity), width = 1.2, and "clicks" must go up by 1 immediately after
# you right-click the center of the Start label from within 3 blocks.

tellraw @s [{"text":"--- lobby button debug ---","color":"gold"}]
tellraw @s [{"text":"state (must be 0): ","color":"gray"},{"score":{"name":"#state","objective":"round"}},{"text":"  #ui (must be 1): ","color":"gray"},{"score":{"name":"#ui","objective":"round"}},{"text":"  #setup: ","color":"gray"},{"score":{"name":"#setup","objective":"round"}}]

scoreboard players set #dbg_p round 0
execute as @a[tag=joined] run scoreboard players add #dbg_p round 1
tellraw @s [{"text":"players with joined tag: ","color":"gray"},{"score":{"name":"#dbg_p","objective":"round"}}]

scoreboard players set #dbg_l round 0
scoreboard players set #dbg_i round 0
execute if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] as @e[type=minecraft:text_display,distance=..6] run scoreboard players add #dbg_l round 1
execute if entity @n[type=minecraft:marker,tag=spawn_staging] at @n[type=minecraft:marker,tag=spawn_staging] as @e[type=minecraft:interaction,distance=..6] run scoreboard players add #dbg_i round 1
tellraw @s [{"text":"labels / interactions near staging marker (want 4 / 4): ","color":"gray"},{"score":{"name":"#dbg_l","objective":"round"}},{"text":" / ","color":"gray"},{"score":{"name":"#dbg_i","objective":"round"}}]

tellraw @s [{"text":"staging marker Tags: ","color":"gray"},{"nbt":"Tags","entity":"@n[type=minecraft:marker,tag=spawn_staging]"},{"text":"   nearest marker Tags: ","color":"gray"},{"nbt":"Tags","entity":"@n[type=minecraft:marker]"}]
tellraw @s [{"text":"start btn Tags: ","color":"gray"},{"nbt":"Tags","entity":"@n[type=minecraft:interaction,tag=hs_btn_start]"}]
tellraw @s [{"text":"start btn width / height / last right-click: ","color":"gray"},{"nbt":"width","entity":"@n[type=minecraft:interaction,tag=hs_btn_start]"},{"text":" / ","color":"gray"},{"nbt":"height","entity":"@n[type=minecraft:interaction,tag=hs_btn_start]"},{"text":" / ","color":"gray"},{"nbt":"interaction.timestamp","entity":"@n[type=minecraft:interaction,tag=hs_btn_start]"}]
tellraw @s [{"text":"start btn baseline: ","color":"gray"},{"score":{"name":"#btn_s_prev","objective":"round"}},{"text":"   join btn baseline: ","color":"gray"},{"score":{"name":"#btn_j_prev","objective":"round"}}]
tellraw @s [{"text":"start / join / add / remove baselines: ","color":"gray"},{"score":{"name":"#btn_s_prev","objective":"round"}},{"text":" / ","color":"gray"},{"score":{"name":"#btn_j_prev","objective":"round"}},{"text":" / ","color":"gray"},{"score":{"name":"#btn_add_prev","objective":"round"}},{"text":" / ","color":"gray"},{"score":{"name":"#btn_rm_prev","objective":"round"}}]
tellraw @s [{"text":"nearest label Tags: ","color":"gray"},{"nbt":"Tags","entity":"@n[type=minecraft:text_display]"}]
tellraw @s [{"text":"now right-click Start, run this again: clicks must increase by 1","color":"gold"}]
