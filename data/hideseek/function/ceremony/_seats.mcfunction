# Seat one spectator, then recurse until the whole crowd is placed.
#
# Bands, filled in order so a small crowd gathers in the middle of the U:
#   front row : #cer_front seats across, centred on the audience marker   (seats 0 .. f-1)
#   left arm  : #cer_arms seats running back, one side of the U           (seats f .. f+a-1)
#   right arm : #cer_arms seats running back, the other side              (seats f+a .. f+2a-1)
#   overflow  : extra centred rows behind the front row                   (anything beyond)
#
# Offsets, in the audience marker's frame (it faces the podium, so +fwd walks into the U
# towards the podium):
#   #cer_left : blocks to the crowd's right
#   #cer_fwd  : blocks towards the podium; the arms step to negative values, i.e. back
#
# One random unseated spectator is moved per call, so seating order is arbitrary.
#
# IMPORTANT: `execute if score <a> matches <range>` only accepts a literal range, never a
# score reference, so every band test below uses the two-score comparison form instead.

execute if score #cer_i round >= #cer_n round run return fail

# Band boundaries
scoreboard players operation #cer_b1 round = #cer_front round
scoreboard players operation #cer_b2 round = #cer_b1 round
scoreboard players operation #cer_b2 round += #cer_arms round
scoreboard players operation #cer_b3 round = #cer_b2 round
scoreboard players operation #cer_b3 round += #cer_arms round

# Front row: centred, one gap apart, level with the marker
scoreboard players operation #cer_left round = #cer_i round
scoreboard players operation #cer_half round = #cer_front round
scoreboard players remove #cer_half round 1
scoreboard players operation #cer_half round /= #2 round
scoreboard players operation #cer_left round -= #cer_half round
scoreboard players operation #cer_left round *= #cer_gap round
scoreboard players set #cer_fwd round 0

# Left arm: constant sideways offset, each seat one gap further back
execute if score #cer_i round >= #cer_b1 round run scoreboard players operation #cer_arm round = #cer_i round
execute if score #cer_i round >= #cer_b1 round run scoreboard players operation #cer_arm round -= #cer_b1 round
execute if score #cer_i round >= #cer_b1 round run scoreboard players set #cer_left round 0
execute if score #cer_i round >= #cer_b1 round run scoreboard players operation #cer_left round -= #cer_side round
execute if score #cer_i round >= #cer_b1 round run scoreboard players operation #cer_fwd round = #cer_arm round
execute if score #cer_i round >= #cer_b1 round run scoreboard players operation #cer_fwd round *= #cer_gap round
execute if score #cer_i round >= #cer_b1 round run scoreboard players remove #cer_fwd round 1

# Right arm: mirrored
execute if score #cer_i round >= #cer_b2 round run scoreboard players operation #cer_arm round = #cer_i round
execute if score #cer_i round >= #cer_b2 round run scoreboard players operation #cer_arm round -= #cer_b2 round
execute if score #cer_i round >= #cer_b2 round run scoreboard players set #cer_left round 0
execute if score #cer_i round >= #cer_b2 round run scoreboard players operation #cer_left round += #cer_side round
execute if score #cer_i round >= #cer_b2 round run scoreboard players operation #cer_fwd round = #cer_arm round
execute if score #cer_i round >= #cer_b2 round run scoreboard players operation #cer_fwd round *= #cer_gap round
execute if score #cer_i round >= #cer_b2 round run scoreboard players remove #cer_fwd round 1

# Overflow: further centred rows, each one gap further back
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_arm round = #cer_i round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_arm round -= #cer_b3 round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_col round = #cer_arm round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_row round = #cer_arm round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_row round /= #cer_front round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_col round %= #cer_front round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_left round = #cer_col round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_left round -= #cer_half round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_left round *= #cer_gap round
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_fwd round = #cer_row round
execute if score #cer_i round >= #cer_b3 round run scoreboard players remove #cer_fwd round 1
execute if score #cer_i round >= #cer_b3 round run scoreboard players operation #cer_fwd round *= #cer_gap round

# Apply this seat, then move on to the next.
# _seat_apply reads #cer_left / #cer_fwd straight from the scoreboard, so no macro
# arguments are needed (and macros are not allowed in teleport coordinates anyway).
function hideseek:ceremony/_seat_apply

scoreboard players add #cer_i round 1
function hideseek:ceremony/_seats
