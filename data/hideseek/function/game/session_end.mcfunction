# A rotation-limited session finished. The round is already cleaned up; retain
# scores until the podium ceremony ends so its ranking is still available.
function hideseek:game/off
function hideseek:lobby/restore_all_gamemodes
scoreboard players set #intermission round -1
bossbar set hideseek:timer players
function hideseek:lobby/sync_buttons
scoreboard players set #cur_start round -1
scoreboard players set #cur_dummy round -1
scoreboard players set #ceremony_session round 1
execute if entity @a[tag=joined] run function hideseek:ceremony/start
execute unless score #ceremony_active round matches 1 as @a[tag=hs_home_saved] run function hideseek:lobby/return_home
execute unless score #ceremony_active round matches 1 run function hideseek:game/reset_scores
execute unless score #ceremony_active round matches 1 run scoreboard players set #ceremony_session round 0
scoreboard players set #session_round round 0
