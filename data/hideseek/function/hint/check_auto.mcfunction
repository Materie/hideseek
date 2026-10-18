scoreboard players remove #hint_timer round 1
execute if score #hint_timer round matches ..0 run function hideseek:hint/fire
execute if score #hint_timer round matches ..0 run scoreboard players operation #hint_timer round = #hint_interval round
