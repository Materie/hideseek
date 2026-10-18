scoreboard players set @s known 1
execute if score #state round matches 1..3 run gamemode spectator @s
execute if score #state round matches 1..3 run tp @s @n[type=minecraft:marker,tag=spawn_hider]
execute if score #state round matches 1..3 run tellraw @a [{"selector":"@s"},{"text":" joined mid-round and is spectating.","color":"gray"}]
