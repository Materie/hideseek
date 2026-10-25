# Save this player's location once, immediately before a forced join moves them.
# Scores hold thousandths of a block; the tag prevents later rounds/force-starts
# from overwriting the original return position.
execute if entity @s[tag=hs_home_saved] run return fail
execute store result score @s hs_home_x run data get entity @s Pos[0] 1000
execute store result score @s hs_home_y run data get entity @s Pos[1] 1000
execute store result score @s hs_home_z run data get entity @s Pos[2] 1000
scoreboard players set @s hs_home_dim 0
execute at @s if dimension minecraft:the_nether run scoreboard players set @s hs_home_dim 1
execute at @s if dimension minecraft:the_end run scoreboard players set @s hs_home_dim 2
tag @s add hs_home_saved
