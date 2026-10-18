scoreboard players add #hid_counter round 1
scoreboard players operation @s hid = #hid_counter round
execute store result storage hideseek:tmp id int 1 run scoreboard players get @s hid
function hideseek:dc/summon with storage hideseek:tmp
