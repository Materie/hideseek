# Toggle setup mode from the menu: reveals/hides (and enables/disables) the dummy controls.
execute if score #setup round matches 1 run return run function hideseek:lobby/setup_off
function hideseek:lobby/setup_on
