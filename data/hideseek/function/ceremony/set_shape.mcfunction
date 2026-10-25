# Shape settings for the U-shaped crowd (blocks):
#   #cer_front   seats across the front row, in front of the podium
#   #cer_arms    seats up each of the two arms
#   #cer_side    how far out from the centre line the arms run
#   #cer_gap     spacing between neighbours
#
# The U is built from the audience marker: a front row across the middle, and two arms
# running back towards (and past) the podium.
scoreboard players set #cer_front round 7
scoreboard players set #cer_arms round 4
scoreboard players set #cer_side round 8
scoreboard players set #cer_gap round 2
tellraw @s {"text":"Ceremony layout reset: 7 across the front, 4 up each arm, arms 8 out, 2 blocks apart.","color":"aqua"}
