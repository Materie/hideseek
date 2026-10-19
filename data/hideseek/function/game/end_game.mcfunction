function hideseek:game/finish_round
# Restore team defaults so other games in this world aren't affected
team modify hiders friendlyFire true
team modify seekers friendlyFire true
# Everyone back to default, lobby included
gamemode survival @a
scoreboard players set #intermission round -1
bossbar set hideseek:timer players
function hideseek:game/reset_scores
function hideseek:game/off
# Sync button click baselines, so right-clicks made mid-round don't fire when the lobby returns
function hideseek:lobby/sync_buttons
tellraw @a {"text":"Game ended. Press the start button to begin a new game.","color":"gold"}