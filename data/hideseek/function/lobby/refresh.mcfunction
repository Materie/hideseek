# Update the conditional labels:
#   Start explains what is missing until 2+ participants are ready (joined + dummies).
#   Dummy controls explain how to enable setup mode when it is off.
# The join/leave label is shared, so use Join / Leave if the roster is mixed.
execute unless entity @n[type=minecraft:text_display,tag=hs_label_start] run return fail

scoreboard players set #players round 0
execute store result score #players round if entity @a[tag=joined]
scoreboard players operation #joined round = #players round
scoreboard players operation #players round += #dummies round
scoreboard players set #online round 0
execute store result score #online round if entity @a

scoreboard players set #vis_start round 0
execute if score #players round matches 2.. run scoreboard players set #vis_start round 1
scoreboard players set #vis_dummy round 0
execute if score #setup round matches 1 run scoreboard players set #vis_dummy round 1
scoreboard players set #vis_join round 0
execute if score #joined round matches 1.. run scoreboard players set #vis_join round 2
execute if score #joined round matches 1.. if score #joined round = #online round run scoreboard players set #vis_join round 1

execute unless score #vis_start round = #cur_start round run function hideseek:lobby/apply_labels
execute unless score #vis_dummy round = #cur_dummy round run function hideseek:lobby/apply_labels
execute unless score #vis_join round = #cur_join round run function hideseek:lobby/apply_labels
scoreboard players operation #cur_start round = #vis_start round
scoreboard players operation #cur_dummy round = #vis_dummy round
scoreboard players operation #cur_join round = #vis_join round
