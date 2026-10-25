# Mounted players stay put without per-tick teleports. Only fallback players
# need the old marker lock; an unseated player remounts on the next tick.
execute as @a[tag=cer_frozen] run function hideseek:ceremony/hold_player
execute as @a[tag=cer_mounted] run function hideseek:ceremony/hold_mounted
scoreboard players remove #cer_timer round 1
execute if score #cer_timer round matches ..0 run function hideseek:ceremony/next
