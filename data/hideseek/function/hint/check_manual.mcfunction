# Tick down the debounce cooldown
execute if score #hint_cooldown round matches 1.. run scoreboard players remove #hint_cooldown round 1

# While cooling down, skip detection
execute if score #hint_cooldown round matches 1.. run return 0

# Detect COAS right-click and fire hint if triggered
execute as @a[tag=seeker] run function hideseek:hint/check_seeker
