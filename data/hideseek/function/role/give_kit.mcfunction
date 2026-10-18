# Start from a clean slate
clear @a
effect clear @a

# One-shot sword for the seeker
give @a[tag=seeker] minecraft:iron_sword[minecraft:custom_name={text:"Galaxy's Edge",italic:false,color:"light_purple"},minecraft:attribute_modifiers=[{type:"minecraft:attack_damage",id:"hideseek:one_shot",amount:1000,operation:"add_value",slot:"mainhand"}],minecraft:lore=[{"text":"The sharpest sword in the galaxy.","color":"gray","italic":false}],minecraft:unbreakable={}]


# Hint item for the seeker (right-click to fire rockets from all hiders)
$execute if score #hint_uses round matches 1.. run give @a[tag=seeker] minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Summoning Rod",color:"gold",italic:false},minecraft:lore=[{text:"Right-click to reveal all hiders.","color":"gray","italic":false},{text:"$(hint_uses) uses per round.","color":"dark_gray","italic":false}],minecraft:unbreakable={}]

# Seeker is visible and slightly faster for the whole round
effect give @a[tag=seeker] minecraft:glowing infinite 0 true
effect give @a[tag=seeker] minecraft:speed infinite 2 true
# No hunger for everyone
effect give @a minecraft:saturation infinite 0 true

# Blast-resistant helmet for all players (protects hiders from hint fireworks)
item replace entity @a armor.head with minecraft:turtle_helmet[minecraft:custom_name=[{"text":"Safety","italic":false, obfuscated: true}, {"text":" Helmet","italic":false, obfuscated: false}],minecraft:enchantments={"minecraft:blast_protection":4},minecraft:unbreakable={}]