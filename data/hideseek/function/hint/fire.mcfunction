# Only fire if uses remain
execute if score #hint_uses round matches ..0 run return run tellraw @a[tag=seeker] {"text":"No hints remaining!","color":"red"}

scoreboard players remove #hint_uses round 1

# Firework above every active hider position, launched high enough to avoid blast damage
execute as @a[tag=hider] at @s run summon minecraft:firework_rocket ~ ~8 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;16711680]}]}}}}
execute as @e[type=minecraft:husk,tag=dummy_hider] at @s run summon minecraft:firework_rocket ~ ~8 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;16711680]}]}}}}
execute as @e[tag=hider_pos] at @s run summon minecraft:firework_rocket ~ ~8 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;16711680]}]}}}}

# Set cooldown so one right-click can't spam (20 ticks = 1 second debounce)
scoreboard players set #hint_cooldown round 20

tellraw @a [{"text":"Hint fired! ","color":"yellow"},{"score":{"name":"#hint_uses","objective":"round"}},{"text":" use(s) remaining.","color":"yellow"}]
