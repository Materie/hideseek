# Update the conditional labels:
#   [ Start Round ] only exists when 2+ participants are ready (joined + dummies)
#   the dummy controls only exist in setup mode (#setup 1)
# Labels are hidden by emptying their text and background rather than deleting the
# entities, so the fixed 4/4 count the rebuild guard relies on never changes.
execute unless entity @n[type=minecraft:text_display,tag=hs_label_start] run return

execute store result score #players round if entity @a[tag=joined]
scoreboard players operation #players round += #dummies round

scoreboard players set #vis_start round 0
execute if score #players round matches 2.. run scoreboard players set #vis_start round 1
scoreboard players set #vis_dummy round 0
execute if score #setup round matches 1 run scoreboard players set #vis_dummy round 1

execute unless score #vis_start round = #cur_start round run function hideseek:lobby/apply_labels
execute unless score #vis_dummy round = #cur_dummy round run function hideseek:lobby/apply_labels
scoreboard players operation #cur_start round = #vis_start round
scoreboard players operation #cur_dummy round = #vis_dummy round
