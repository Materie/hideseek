# The same physical button joins an outsider or lets a participant leave.
execute if entity @s[tag=joined] run return run function hideseek:lobby/leave
function hideseek:lobby/join
