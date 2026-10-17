execute as @a[tag=hider,scores={died=1..}] run function hideseek:hider_caught

scoreboard players remove #head round 1

# Hold the seeker in staging (3 blocks of wiggle room, keeps their view direction)
execute as @a[tag=seeker] at @s unless entity @e[type=minecraft:marker,tag=spawn_staging,distance=..3] at @n[type=minecraft:marker,tag=spawn_staging] run tp @s ~ ~ ~

# Bossbar: seconds left, rounded up
scoreboard players operation #secs round = #head round
scoreboard players add #secs round 19
scoreboard players operation #secs round /= #20 round
bossbar set hideseek:timer players @a
execute store result bossbar hideseek:timer value run scoreboard players get #head round
bossbar set hideseek:timer name [{"text":"Seeker released in: "},{"score":{"name":"#secs","objective":"round"}},{"text":" s"}]

# Show boundary particle walls to hiders while they scatter
execute if score #head round matches 1.. run function hideseek:boundary_particles

execute if score #head round matches ..0 run function hideseek:release_seeker