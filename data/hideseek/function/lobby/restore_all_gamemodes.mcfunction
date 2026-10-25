# Restore the gamemode of every player on the roster.
# Used by the round / game / ceremony endings so nobody is left stuck in survival (or
# spectator) just because they played a round.
execute as @a[tag=joined] run function hideseek:lobby/restore_gamemode
