# Begin a timed trophy ceremony. Everyone takes an audience seat first;
# bronze, silver and gold are then called up one by one by ceremony/tick.
#
# Called automatically when the rotation cap is reached; can also be run manually
# between rounds with /function hideseek:ceremony/start.
#   - requires at least one player on the roster
#   - 1st/2nd/3rd are whoever has the most points
#   - the audience fills the U built around the audience marker
# The ceremony ends automatically; /function hideseek:ceremony/end skips to the end.

execute if score #ceremony_active round matches 1 run return fail
execute unless entity @a[tag=joined] run return run tellraw @s {"text":"Nobody is on the roster, so there is no ceremony to hold.","color":"yellow"}
execute unless score #state round matches 0 run return run tellraw @a {"text":"Finish the round before holding the trophy ceremony.","color":"yellow"}
function hideseek:ceremony/rank
execute unless entity @n[type=minecraft:marker,tag=podium_gold] run return run tellraw @a {"text":"Set the trophy markers first: /function hideseek:ceremony/set_all","color":"yellow"}
execute unless entity @n[type=minecraft:marker,tag=podium_silver] run return run tellraw @a {"text":"Set the trophy markers first: /function hideseek:ceremony/set_all","color":"yellow"}
execute if entity @a[tag=pod_3] unless entity @n[type=minecraft:marker,tag=podium_bronze] run return run tellraw @a {"text":"Set the bronze marker first: /function hideseek:ceremony/set_bronze","color":"yellow"}
execute unless entity @n[type=minecraft:marker,tag=podium_audience] run return run tellraw @a {"text":"Set the audience marker first: /function hideseek:ceremony/set_all","color":"yellow"}

function hideseek:game/off
scoreboard players set #ceremony_active round 1
# Include future podium winners in the opening audience shot.
tag @a[tag=joined] add pod_audience
function hideseek:ceremony/spread_audience
function hideseek:ceremony/lock_all

title @a times 10 55 10
title @a title {"text":"Trophy Ceremony","color":"gold","bold":true}
title @a subtitle {"text":"Please take your seats","color":"yellow"}
scoreboard players set #cer_phase round 0
scoreboard players set #cer_timer round 60

scoreboard players set #active round 0
scoreboard players set #intermission round -1
bossbar set hideseek:timer players
