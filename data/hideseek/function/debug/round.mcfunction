# Round diagnostics. Uses say (not tellraw) so the output lands in logs/latest.log.

execute if score #state round matches 0 run say [dbg] state=0 (lobby)
execute if score #state round matches 1 run say [dbg] state=1 (round running)
execute if score #state round matches 2 run say [dbg] state=2 (end wait)
execute if score #state round matches 3 run say [dbg] state=3 (head start)

execute as @a[tag=seeker] run say [dbg] I am the SEEKER
execute as @a[tag=hider] run say [dbg] I am a HIDER
execute as @a[tag=joined] run say [dbg] I am on the roster
execute unless entity @a[tag=joined] run say [dbg] roster is empty

execute if entity @e[type=minecraft:husk,tag=dummy_hider] run say [dbg] dummy husks: ALIVE
execute unless entity @e[type=minecraft:husk,tag=dummy_hider] run say [dbg] dummy husks: none

execute if score #state round matches 3 if score #head round matches 1.. run say [dbg] head start still counting
execute if score #state round matches 3 if score #head round matches ..0 run say [dbg] STUCK: head<=0 but still state 3
execute if score #state round matches 1 if score #ticks round matches ..0 run say [dbg] STUCK: ticks<=0 but still state 1

execute if score #active round matches 1 run say [dbg] session active
execute if score #active round matches 1 run say [dbg] session round vs max: (see next two lines)
execute if score #active round matches 1 run scoreboard players get #session_round round
execute if score #active round matches 1 run scoreboard players get #session_max round

execute store result score #dbg_z round run data get entity @p Pos[2]
execute if score #dbg_z round matches ..12 run say [dbg] I am in the LOBBY/staging area (z<=12)
execute if score #dbg_z round matches 13.. run say [dbg] I am past the lobby, out in the arena (z>12)
