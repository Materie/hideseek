execute unless score #state round matches 0 run return run tellraw @p {"text":"Dummies can only be changed in staging.","color":"yellow"}
execute if score #dummies round matches 5.. run return run tellraw @p {"text":"Maximum of 5 dummies.","color":"yellow"}

scoreboard players add #dummies round 1

# Put the new dummy on the sidebar
execute if score #dummies round matches 1 run scoreboard players add Dummy1 points 0
execute if score #dummies round matches 2 run scoreboard players add Dummy2 points 0
execute if score #dummies round matches 3 run scoreboard players add Dummy3 points 0
execute if score #dummies round matches 4 run scoreboard players add Dummy4 points 0
execute if score #dummies round matches 5 run scoreboard players add Dummy5 points 0

tellraw @a [{"text":"Dummies: ","color":"gray"},{"score":{"name":"#dummies","objective":"round"}}]