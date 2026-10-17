execute if score #dummies round matches 1.. run summon minecraft:husk ~ ~ ~ {NoAI:1b,PersistenceRequired:1b,CustomName:"Dummy 1",CustomNameVisible:1b,Tags:["dummy_hider","dummy_1"]}
execute if score #dummies round matches 2.. run summon minecraft:husk ~ ~ ~ {NoAI:1b,PersistenceRequired:1b,CustomName:"Dummy 2",CustomNameVisible:1b,Tags:["dummy_hider","dummy_2"]}
execute if score #dummies round matches 3.. run summon minecraft:husk ~ ~ ~ {NoAI:1b,PersistenceRequired:1b,CustomName:"Dummy 3",CustomNameVisible:1b,Tags:["dummy_hider","dummy_3"]}
execute if score #dummies round matches 4.. run summon minecraft:husk ~ ~ ~ {NoAI:1b,PersistenceRequired:1b,CustomName:"Dummy 4",CustomNameVisible:1b,Tags:["dummy_hider","dummy_4"]}
execute if score #dummies round matches 5.. run summon minecraft:husk ~ ~ ~ {NoAI:1b,PersistenceRequired:1b,CustomName:"Dummy 5",CustomNameVisible:1b,Tags:["dummy_hider","dummy_5"]}

# The highest point dummies may stand at: marker height + 2
execute store result score #ceil round run data get entity @n[type=minecraft:marker,tag=spawn_dummy] Pos[1]
scoreboard players add #ceil round 2
execute store result storage hideseek:tmp ceiling int 1 run scoreboard players get #ceil round
function hideseek:spread_dummies with storage hideseek:tmp