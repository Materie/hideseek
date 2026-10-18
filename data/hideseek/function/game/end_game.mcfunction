function hideseek:game/finish_round
bossbar set hideseek:timer players
function hideseek:game/reset_scores
function hideseek:game/off
tellraw @a {"text":"Game ended. Press the start button to begin a new game.","color":"gold"}