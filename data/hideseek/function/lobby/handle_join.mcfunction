# /trigger hs_join toggles: join when off the roster, leave when on it.
execute if entity @s[tag=joined] run return run function hideseek:lobby/leave
function hideseek:lobby/join
