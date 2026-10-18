$kill @e[tag=dc_$(id)]
$scoreboard players set dc_$(id) dc_state 0
$kill @e[tag=hider_pos_$(id)]
$summon minecraft:marker ~ ~ ~ {NoGravity:1b,Tags:["hider_pos","hider_pos_$(id)"],PortalCooldown:$(id)}
$tellraw @a [{"selector":"@s"},{"text":" reconnected and is back in the game!","color":"green"}]
