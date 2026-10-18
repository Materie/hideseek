# Detect players joining for the first time this session
scoreboard players add @a known 0
execute as @a[scores={known=0}] run function hideseek:core/on_join

scoreboard players add @a points 0

# DC replacement: update position markers for online hiders, detect disconnects
execute if score #state round matches 1 run function hideseek:dc/update
execute if score #state round matches 3 run function hideseek:dc/update

execute if score #state round matches 1 run function hideseek:game/round_tick
execute if score #state round matches 2 run function hideseek:game/end_wait
execute if score #state round matches 3 run function hideseek:core/head_tick