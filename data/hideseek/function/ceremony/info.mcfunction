# Announce the current standings without moving anyone.
execute if score #ceremony_active round matches 1 run return run tellraw @s {"text":"The trophy ceremony is in progress; standings are being announced on the podium.","color":"gold"}
tag @a remove pod_1
tag @a remove pod_2
tag @a remove pod_3
tag @a remove pod_audience
function hideseek:ceremony/rank

tellraw @s {"text":"--- Ceremony standings ---","color":"gold"}
tellraw @s [{"text":"1st: ","color":"gold"},{"selector":"@a[tag=pod_1]"}]
tellraw @s [{"text":"2nd: ","color":"gray"},{"selector":"@a[tag=pod_2]"}]
tellraw @s [{"text":"3rd: ","color":"#cd7f32"},{"selector":"@a[tag=pod_3]"}]
tellraw @s [{"text":"crowd: ","color":"aqua"},{"score":{"name":"#cer_n","objective":"round"}},{"text":" (run /function hideseek:ceremony/start to seat them)","color":"gray"}]

tag @a remove pod_1
tag @a remove pod_2
tag @a remove pod_3
tag @a remove pod_audience
