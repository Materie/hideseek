# Setup mode: reveal (and enable) the dummy controls. Hidden again automatically
# when a round starts.
scoreboard players set #setup round 1
execute if entity @s run tellraw @s {"text":"Setup mode ON: dummy controls are visible and usable.","color":"aqua"}
