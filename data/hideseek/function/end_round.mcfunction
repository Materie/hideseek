# Were any hiders still alive?
scoreboard players set #alive round 0
execute if entity @a[tag=hider] run scoreboard players set #alive round 1
execute if entity @e[type=minecraft:husk,tag=dummy_hider] run scoreboard players set #alive round 1

# Award points
execute if score #alive round matches 1 run scoreboard players add @a[tag=hider] points 1
execute if score #alive round matches 1 run title @a title {"text":"Hiders win!","color":"green"}
execute if score #alive round matches 0 run scoreboard players add @a[tag=seeker] points 1
execute if score #alive round matches 0 run title @a title {"text":"Seeker wins!","color":"red"}

# Hide the timer and start the grace period
bossbar set hideseek:timer players
scoreboard players operation #wait round = #grace round
scoreboard players set #state round 2