# Remember each button's current click counter so that clicks made while the poll
# is not running (mid-round, after the UI is hidden, ...) don't fire when it resumes.
execute if entity @n[type=minecraft:interaction,tag=hs_btn_start] store result score #btn_s_prev round run data get entity @n[type=minecraft:interaction,tag=hs_btn_start] interaction.timestamp
execute if entity @n[type=minecraft:interaction,tag=hs_btn_join] store result score #btn_j_prev round run data get entity @n[type=minecraft:interaction,tag=hs_btn_join] interaction.timestamp
execute if entity @n[type=minecraft:interaction,tag=hs_btn_add] store result score #btn_add_prev round run data get entity @n[type=minecraft:interaction,tag=hs_btn_add] interaction.timestamp
execute if entity @n[type=minecraft:interaction,tag=hs_btn_remove] store result score #btn_rm_prev round run data get entity @n[type=minecraft:interaction,tag=hs_btn_remove] interaction.timestamp
