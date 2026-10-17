function hideseek:finish_round
bossbar set hideseek:timer players
function hideseek:reset_scores
function hideseek:game_off
tellraw @a {"text":"Game ended. Press the start button to begin a new game.","color":"gold"}