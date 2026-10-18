gamerule spawn_monsters false
scoreboard players set #active round 1
function hideseek:game/clear_hostiles
tellraw @a {"text":"Game on: hostile mob spawning disabled.","color":"gray"}