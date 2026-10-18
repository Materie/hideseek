execute unless score #state round matches 0 run return run tellraw @p {"text":"Can't change settings during a round.","color":"yellow"}
scoreboard players set #hint_mode round 1
tellraw @a [{"text":"Hint mode: AUTO (fireworks every ","color":"gray"},{"score":{"name":"#hint_interval","objective":"round"}},{"text":" ticks).","color":"gray"}]
