# Compute delta between current COAS uses and last recorded value
scoreboard players operation #hint_delta round = @s coas_used
scoreboard players operation #hint_delta round -= @s hint_prev
# If seeker right-clicked, fire hint and update baseline
execute if score #hint_delta round matches 1.. run function hideseek:hint_fire
execute if score #hint_delta round matches 1.. run scoreboard players operation @s hint_prev = @s coas_used
