say Hide and seek pack loaded
scoreboard objectives add points dummy "Points"
scoreboard objectives setdisplay sidebar points
team add hiders
team add seekers
team modify hiders nametagVisibility hideForOtherTeams
team modify seekers color red
scoreboard objectives add round dummy
scoreboard players add #state round 0
bossbar add hideseek:timer {"text":"Time left"}
bossbar set hideseek:timer color red
scoreboard players set #2 round 2
scoreboard players set #20 round 20
scoreboard players set #60 round 60
scoreboard objectives add died deathCount
scoreboard players set #grace round 60
scoreboard players add #dummies round 0
scoreboard players add #active round 0
scoreboard players set #headstart round 600
scoreboard players add #adventure round 0
scoreboard objectives add seeks dummy "Times as Seeker"
scoreboard objectives add status dummy
scoreboard objectives modify status displayname {"text":"Round Status","color":"gold"}
scoreboard players set #rotation round 1
scoreboard objectives add known dummy
scoreboard objectives add coas_used minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add hint_prev dummy
scoreboard players set #hint_mode round 0
scoreboard players set #hint_uses round 5
scoreboard players set #hint_interval round 1200
scoreboard objectives add hid dummy
scoreboard objectives add dc_state dummy
scoreboard players set #bound_size round 50
scoreboard players set #base round 1200
scoreboard players set #per_hider round 300