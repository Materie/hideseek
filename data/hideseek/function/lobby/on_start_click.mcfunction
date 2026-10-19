# Runs positioned at the Start button; the clicker is the nearest player to it.
execute unless entity @p[distance=..4] run return
execute as @p[distance=..4] run function hideseek:lobby/start_click
