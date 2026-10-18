function hideseek:game/finish_round
# Restore team defaults so other games in this world aren't affected
team modify hiders friendlyFire true
team modify seekers friendlyFire true
bossbar set hideseek:timer players
function hideseek:game/reset_scores
function hideseek:game/off
tellraw @a {"text":"Game ended. Press the start button to begin a new game.","color":"gold"}