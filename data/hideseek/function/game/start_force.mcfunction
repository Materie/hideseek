# Force-start (op only): everyone online joins the roster, then the round starts
tag @a add joined
tellraw @a {"text":"Force-start: everyone online has been added to the game.","color":"gold"}
function hideseek:game/try_start
