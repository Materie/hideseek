# Ensure a boundary centre exists (fall back to hider spawn)
execute unless entity @e[type=minecraft:marker,tag=bound_centre] at @n[type=minecraft:marker,tag=spawn_hider] run summon minecraft:marker ~ ~ ~ {Tags:["bound_centre"],tags:["bound_centre"]}

# Store centre XYZ into shared storage
data modify storage hideseek:tmp bx set from entity @n[type=minecraft:marker,tag=bound_centre] Pos[0]
data modify storage hideseek:tmp by set from entity @n[type=minecraft:marker,tag=bound_centre] Pos[1]
data modify storage hideseek:tmp bz set from entity @n[type=minecraft:marker,tag=bound_centre] Pos[2]

# Store diameter and half-diameter (used by particle wall and worldborder apply)
execute store result storage hideseek:tmp bsize int 1 run scoreboard players get #bound_size round
scoreboard players operation #bhalf round = #bound_size round
scoreboard players operation #bhalf round /= #2 round
execute store result storage hideseek:tmp bhalf int 1 run scoreboard players get #bhalf round
