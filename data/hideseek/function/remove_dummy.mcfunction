execute unless score #state round matches 0 run return run tellraw @p {"text":"Dummies can only be changed in staging.","color":"yellow"}
execute if score #dummies round matches ..0 run return run tellraw @p {"text":"No dummies to remove.","color":"yellow"}

# Take the highest dummy off the sidebar (this also discards its score)
execute if score #dummies round matches 1 run scoreboard players reset Dummy1 points
execute if score #dummies round matches 2 run scoreboard players reset Dummy2 points
execute if score #dummies round matches 3 run scoreboard players reset Dummy3 points
execute if score #dummies round matches 4 run scoreboard players reset Dummy4 points
execute if score #dummies round matches 5 run scoreboard players reset Dummy5 points

scoreboard players remove #dummies round 1

tellraw @a [{"text":"Dummies: ","color":"gray"},{"score":{"name":"#dummies","objective":"round"}}]