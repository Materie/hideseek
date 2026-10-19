# Poll the lobby buttons' interaction counters while idle.
# Right-click only - the attack counter (left-click) is deliberately unused.
# The clicker is resolved as the nearest player to the button (interaction reach is ~3 blocks).

# [ Start Round ]: only a joined player can start, and only with 2+ participants
execute if entity @n[type=minecraft:interaction,tag=hs_btn_start] store result score #btn_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_start] interaction.timestamp
execute if score #btn_cur round > #btn_s_prev round at @n[type=minecraft:interaction,tag=hs_btn_start] run function hideseek:lobby/on_start_click
scoreboard players operation #btn_s_prev round = #btn_cur round

# [ Join ]: the nearest player joins the roster
execute if entity @n[type=minecraft:interaction,tag=hs_btn_join] store result score #btn_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_join] interaction.timestamp
execute if score #btn_cur round > #btn_j_prev round at @n[type=minecraft:interaction,tag=hs_btn_join] run function hideseek:lobby/on_join_click
scoreboard players operation #btn_j_prev round = #btn_cur round

# [ + Dummy ] / [ - Dummy ]: actions are global, so feedback lands on a joined player,
# or any online player when the roster is still empty (otherwise clicks would be silent).
execute if entity @n[type=minecraft:interaction,tag=hs_btn_add] store result score #btn_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_add] interaction.timestamp
execute if score #btn_cur round > #btn_add_prev round if entity @a[tag=joined] run execute as @r[tag=joined] run function hideseek:dummy/add
execute if score #btn_cur round > #btn_add_prev round unless entity @a[tag=joined] run execute as @a[limit=1] run function hideseek:dummy/add
scoreboard players operation #btn_add_prev round = #btn_cur round

execute if entity @n[type=minecraft:interaction,tag=hs_btn_remove] store result score #btn_cur round run data get entity @n[type=minecraft:interaction,tag=hs_btn_remove] interaction.timestamp
execute if score #btn_cur round > #btn_rm_prev round if entity @a[tag=joined] run execute as @r[tag=joined] run function hideseek:dummy/remove
execute if score #btn_cur round > #btn_rm_prev round unless entity @a[tag=joined] run execute as @a[limit=1] run function hideseek:dummy/remove
scoreboard players operation #btn_rm_prev round = #btn_cur round
