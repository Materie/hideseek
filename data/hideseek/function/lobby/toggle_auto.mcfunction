# Flip #auto_start (1 -> 0 or 0 -> 1) without a second function
scoreboard players operation #tmp round = #auto_start round
scoreboard players set #auto_start round 1
execute if score #tmp round matches 1 run scoreboard players set #auto_start round 0
scoreboard players set #intermission round -1

execute if score #auto_start round matches 0 run tellraw @s {"text":"Auto-start OFF. Start rounds from the menu or with /function hideseek:game/try_start.","color":"yellow"}
execute if score #auto_start round matches 1 run tellraw @s {"text":"Auto-start ON. The next round begins automatically after the intermission.","color":"green"}
