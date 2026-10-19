# A rotation-limited session finished: stop the loop exactly like the End button,
# but without re-running finish_round (the round already ended normally).
function hideseek:game/off
gamemode survival @a
scoreboard players set #intermission round -1
bossbar set hideseek:timer players
function hideseek:game/reset_scores
function hideseek:lobby/sync_buttons
scoreboard players set #cur_start round -1
scoreboard players set #cur_dummy round -1
tellraw @a [{"text":"Session complete after ","color":"gold"},{"score":{"name":"#session_max","objective":"round"}},{"text":" round(s). Press ","color":"gold"},{"text":"[ Start Round ]","color":"green"},{"text":" to play again.","color":"gold"}]
scoreboard players set #session_round round 0
