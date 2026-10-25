# Toggle the on-screen lobby labels from the menu.
execute if score #ui round matches 1 run function hideseek:lobby/ui_off
execute unless score #ui round matches 1 run function hideseek:lobby/ui_on
