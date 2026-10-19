# Leave setup mode: hide (and disable) the dummy controls.
scoreboard players set #setup round 0
execute if entity @s run tellraw @s {"text":"Setup mode OFF: dummy controls hidden.","color":"aqua"}
