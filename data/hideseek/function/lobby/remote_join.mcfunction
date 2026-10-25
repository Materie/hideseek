# A player accepted a remote invitation with /trigger hs_join (or the menu).
# Unlike the physical lobby button, save their location before bringing them
# to staging; lobby/return_home restores it on leave or at session end.
execute if score #ceremony_active round matches 1 run return run tellraw @s {"text":"Wait until the trophy ceremony ends before joining.","color":"yellow"}
execute if entity @s[tag=joined] run return run tellraw @s {"text":"You are already in the game.","color":"yellow"}
execute at @s unless dimension minecraft:overworld unless dimension minecraft:the_nether unless dimension minecraft:the_end run return run tellraw @s {"text":"A remote join cannot save a return point in this dimension.","color":"yellow"}
execute in minecraft:overworld unless entity @n[type=minecraft:marker,tag=spawn_staging] run return run tellraw @s {"text":"Staging is not available right now. Please try again later.","color":"yellow"}
function hideseek:lobby/save_home
function hideseek:lobby/join
execute in minecraft:overworld at @n[type=minecraft:marker,tag=spawn_staging] run tp @s ~ ~ ~ ~ ~
