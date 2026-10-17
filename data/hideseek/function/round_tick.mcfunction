# Hiders who died this round are out
execute as @a[tag=hider,scores={died=1..}] run function hideseek:hider_caught

# Hint system
function hideseek:hint_check

scoreboard players remove #ticks round 1

# Convert ticks to minutes and seconds (rounded up)
scoreboard players operation #secs round = #ticks round
scoreboard players add #secs round 19
scoreboard players operation #secs round /= #20 round
scoreboard players operation #min round = #secs round
scoreboard players operation #min round /= #60 round
scoreboard players operation #sec round = #secs round
scoreboard players operation #sec round %= #60 round

# Bossbar
bossbar set hideseek:timer players @a
execute store result bossbar hideseek:timer value run scoreboard players get #ticks round
execute if score #sec round matches 10.. run bossbar set hideseek:timer name [{"text":"Time left: "},{"score":{"name":"#min","objective":"round"}},{"text":":"},{"score":{"name":"#sec","objective":"round"}}]
execute if score #sec round matches ..9 run bossbar set hideseek:timer name [{"text":"Time left: "},{"score":{"name":"#min","objective":"round"}},{"text":":0"},{"score":{"name":"#sec","objective":"round"}}]

# Move caught dummies to the Caught section of the status board
execute unless entity @e[type=minecraft:husk,tag=dummy_1] if score Dummy1 status matches 6 run scoreboard players set Dummy1 status 3
execute unless entity @e[type=minecraft:husk,tag=dummy_2] if score Dummy2 status matches 6 run scoreboard players set Dummy2 status 3
execute unless entity @e[type=minecraft:husk,tag=dummy_3] if score Dummy3 status matches 6 run scoreboard players set Dummy3 status 3
execute unless entity @e[type=minecraft:husk,tag=dummy_4] if score Dummy4 status matches 6 run scoreboard players set Dummy4 status 3
execute unless entity @e[type=minecraft:husk,tag=dummy_5] if score Dummy5 status matches 6 run scoreboard players set Dummy5 status 3

# End the round if every hider is out (dummy and dc husks also count)
execute if score #state round matches 1 unless entity @a[tag=hider] unless entity @e[type=minecraft:husk,tag=dummy_hider] unless entity @e[type=minecraft:husk,tag=dc_hider] run function hideseek:end_round

# End the round if time ran out
execute if score #state round matches 1 if score #ticks round matches ..0 run function hideseek:end_round