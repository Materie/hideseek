# Clear any leftover status entries from a previous round
scoreboard players reset * status

# Write the section headers as fake-player entries (§c=red, §a=green, §7=gray)
scoreboard players set §cSeeking§r status 10
scoreboard players set §r status 8
scoreboard players set §aHiding§r status 7
scoreboard players set §r§r status 5
scoreboard players set §7Caught§r status 4

# Set real player scores by role
scoreboard players set @a[tag=seeker] status 9
scoreboard players set @a[tag=hider] status 6

# Add active dummies as fake-player entries under Hiding
execute if score #dummies round matches 1.. run scoreboard players set Dummy1 status 6
execute if score #dummies round matches 2.. run scoreboard players set Dummy2 status 6
execute if score #dummies round matches 3.. run scoreboard players set Dummy3 status 6
execute if score #dummies round matches 4.. run scoreboard players set Dummy4 status 6
execute if score #dummies round matches 5.. run scoreboard players set Dummy5 status 6

# Neutralise seeker team colour so their name renders white on the sidebar
team modify seekers color white

# Switch the sidebar to the status objective
scoreboard objectives setdisplay sidebar status
