# Poll the lobby buttons' interaction counters while idle.
#
# Right-click only - the attack counter (left-click) is deliberately unused.
# `execute as <interaction> on target` gives the exact player who most recently right-clicked
# that button: `on target` reads the executor's own last-interacted entity, so the button
# entity itself must be the executor of that subcommand.
#
# Each button keeps its own "current" score as well as its "previous" baseline: a single
# shared score would be overwritten by each poll and every comparison would then read the
# wrong button's timestamp.

# [ Start Round ]: only a joined player can start, and only with 2+ participants
execute if entity @n[type=minecraft:interaction,tag=hs_btn_start] store result score #btn_s_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_start] interaction.timestamp
execute if score #btn_s_cur round > #btn_s_prev round as @n[type=minecraft:interaction,tag=hs_btn_start] on target run function hideseek:lobby/on_start_click
scoreboard players operation #btn_s_prev round = #btn_s_cur round

# [ Join ]: the clicker joins the roster
execute if entity @n[type=minecraft:interaction,tag=hs_btn_join] store result score #btn_j_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_join] interaction.timestamp
execute if score #btn_j_cur round > #btn_j_prev round as @n[type=minecraft:interaction,tag=hs_btn_join] on target run function hideseek:lobby/on_join_click
scoreboard players operation #btn_j_prev round = #btn_j_cur round

# [ + Dummy ] / [ - Dummy ]: execute as the actual clicker so setup feedback reaches
# the person who pressed the button, not a random participant.
execute if entity @n[type=minecraft:interaction,tag=hs_btn_add] store result score #btn_add_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_add] interaction.timestamp
execute if score #btn_add_cur round > #btn_add_prev round as @n[type=minecraft:interaction,tag=hs_btn_add] on target run function hideseek:dummy/add
scoreboard players operation #btn_add_prev round = #btn_add_cur round

execute if entity @n[type=minecraft:interaction,tag=hs_btn_remove] store result score #btn_rm_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_remove] interaction.timestamp
execute if score #btn_rm_cur round > #btn_rm_prev round as @n[type=minecraft:interaction,tag=hs_btn_remove] on target run function hideseek:dummy/remove
scoreboard players operation #btn_rm_prev round = #btn_rm_cur round
