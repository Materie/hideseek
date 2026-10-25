# Capture a player's current mode before the match changes it.
scoreboard players set @s gm_prev 0
execute if entity @s[gamemode=creative] run scoreboard players set @s gm_prev 1
execute if entity @s[gamemode=adventure] run scoreboard players set @s gm_prev 2
execute if entity @s[gamemode=spectator] run scoreboard players set @s gm_prev 3
