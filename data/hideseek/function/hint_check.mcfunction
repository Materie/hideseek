# Manual (COAS) mode
execute if score #hint_mode round matches 0 run function hideseek:hint_check_manual

# Auto timer mode
execute if score #hint_mode round matches 1 run function hideseek:hint_check_auto
