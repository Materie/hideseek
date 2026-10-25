# Called as/at one player. Allocate a unique anchor id and summon at their feet.
scoreboard players add #cer_next round 1
scoreboard players operation @s cer_id = #cer_next round
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cer_anchor","cer_new"],tags:["cer_anchor","cer_new"]}
scoreboard players operation @n[type=minecraft:marker,tag=cer_new] cer_id = #cer_next round
tag @e[type=minecraft:marker,tag=cer_new] remove cer_new
tag @s add cer_frozen
# A participant arriving on another mount must leave it before taking a seat.
ride @s dismount
function hideseek:ceremony/mount_player
