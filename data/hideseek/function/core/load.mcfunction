say Hide and seek pack loaded
scoreboard objectives add points dummy "Points"
scoreboard objectives setdisplay sidebar points
team add hiders
team add seekers
team modify hiders nametagVisibility hideForOtherTeams
team modify seekers color red
scoreboard objectives add round dummy
scoreboard players add #state round 0
bossbar add hideseek:timer {"text":"Time left"}
bossbar set hideseek:timer color red
scoreboard players set #2 round 2
scoreboard players set #20 round 20
scoreboard players set #60 round 60
scoreboard objectives add died deathCount
scoreboard players set #grace round 60
scoreboard players add #dummies round 0
scoreboard players add #active round 0
scoreboard players set #headstart round 600
scoreboard players set #headstart_dummy round 30
scoreboard players add #adventure round 0
scoreboard objectives add seeks dummy "Times as Seeker"
scoreboard objectives add status dummy
scoreboard objectives modify status displayname {"text":"Round Status","color":"gold"}
scoreboard players set #rotation round 1
scoreboard objectives add known dummy
scoreboard objectives add coas_used minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add hint_prev dummy
scoreboard players set #hint_mode round 0
scoreboard players set #hint_uses round 5
scoreboard players set #hint_interval round 1200
scoreboard objectives add hid dummy
scoreboard objectives add dc_state dummy
scoreboard players set #bound_size round 90
scoreboard players set #base round 1200
scoreboard players set #per_hider round 300
scoreboard players set #19 round 19

# Match flow: roster/menu triggers, lobby buttons, auto-start intermission
scoreboard objectives add hs_join trigger
scoreboard objectives add hs_menu trigger
# Ceremony placement: a working copy of each player's points, used by ceremony/rank
scoreboard objectives add rank dummy
# Gamemode memory: each joined player's gamemode is stored here on join so the pack can put
# them back the way they were when a round / the game / the ceremony ends (0 survival,
# 1 creative, 2 adventure, 3 spectator). Players with no stored value fall back to survival.
scoreboard objectives add gm_prev dummy
# Forced joins remember their pre-lobby location until leave or match end.
scoreboard objectives add hs_home_x dummy
scoreboard objectives add hs_home_y dummy
scoreboard objectives add hs_home_z dummy
scoreboard objectives add hs_home_dim dummy
scoreboard objectives add cer_id dummy
scoreboard players add #ceremony_active round 0
scoreboard players add #ceremony_session round 0
scoreboard players set #auto_start round 1
scoreboard players set #intermission round -1
scoreboard players set #intermission_time round 300
# Click baselines persist in the scoreboard; only seed them when absent and
# re-sync to the live buttons (a reset to 0 would re-fire the last stored click).
scoreboard players add #btn_s_cur round 0
scoreboard players add #btn_j_cur round 0
scoreboard players add #btn_add_cur round 0
scoreboard players add #btn_rm_cur round 0
scoreboard players add #btn_s_prev round 0
scoreboard players add #btn_j_prev round 0
scoreboard players add #btn_add_prev round 0
scoreboard players add #btn_rm_prev round 0
function hideseek:lobby/sync_buttons

# Session config:
#   #ui       1 = lobby labels shown, 0 = hidden (command-block / public mode)
#   #setup    1 = dummy controls shown and usable (op setup mode)
#   #rotations rounds each player gets as seeker before the session ends by itself
# These are seeded once and then persist across /reload, so an operator's choice sticks.
execute unless score #cfg_init round matches 1 run scoreboard players set #ui round 1
execute unless score #cfg_init round matches 1 run scoreboard players set #setup round 0
execute unless score #cfg_init round matches 1 run scoreboard players set #rotations round 1
scoreboard players set #cfg_init round 1
# Preserve progress across /reload; game/on and session_end reset these at their
# proper lifecycle points. Resetting them here could lose the saved match mode.
scoreboard players add #session_round round 0
scoreboard players add #session_max round 0
execute if score #session_max round matches ..0 run scoreboard players set #session_max round 1
# Conditional-label visibility caches (see lobby/refresh)
scoreboard players set #vis_start round 0
scoreboard players set #cur_start round -1
scoreboard players set #vis_dummy round 0
scoreboard players set #cur_dummy round -1
scoreboard players set #cur_join round -1

# Ceremony crowd layout (see ceremony/set_shape). Seeded independently of #cfg_init so that
# worlds that already ran an older version of this pack still get sane defaults.
scoreboard players add #cer_front round 0
execute if score #cer_front round matches ..0 run scoreboard players set #cer_front round 7
scoreboard players add #cer_arms round 0
execute if score #cer_arms round matches ..0 run scoreboard players set #cer_arms round 4
scoreboard players add #cer_side round 0
execute if score #cer_side round matches ..0 run scoreboard players set #cer_side round 8
scoreboard players add #cer_gap round 0
execute if score #cer_gap round matches ..0 run scoreboard players set #cer_gap round 2

# Clear any leftover ceremony seating marks (players persist across reloads)
tag @a remove cer_seated
