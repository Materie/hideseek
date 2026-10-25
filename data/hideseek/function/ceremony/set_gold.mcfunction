# --- Ceremony anchors ---------------------------------------------------------------
# All four are plain markers, set while standing on the spot:
#   /function hideseek:ceremony/set_gold      -> 1st place stands here
#   /function hideseek:ceremony/set_silver    -> 2nd place stands here (podium centre)
#   /function hideseek:ceremony/set_bronze    -> 3rd place stands here
#   /function hideseek:ceremony/set_audience  -> middle of the front row of the crowd
# Only silver and audience are needed for the layout; gold/bronze just place the winners.
# Set them all at once relative to your position with /function hideseek:ceremony/set_all.

kill @e[type=minecraft:marker,tag=podium_gold]
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["podium_gold"],tags:["podium_gold"]}
tellraw @s {"text":"Gold podium (1st place) set to your position.","color":"gold"}
