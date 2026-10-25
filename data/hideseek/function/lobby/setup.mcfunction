# Place Join and Start around the staging marker; put dummy setup buttons
# together off to one side (x offsets: Join +1, Start -1, Add -3, Remove -5).
# lobby/tick also calls this while idle whenever the button set is incomplete or duplicated.
# NOTE: text_display text lives in entity NBT, which needs SNBT components (not JSON strings),
# and the tag field is written in BOTH spellings because newer versions renamed Tags to tags -
# unknown NBT keys are silently ignored, so this works on either version.

# Clear any previous button sets in range (tag-independent, so broken copies get cleaned too)
execute at @n[type=minecraft:marker,tag=spawn_staging] run kill @e[type=minecraft:interaction,distance=..6]
execute at @n[type=minecraft:marker,tag=spawn_staging] run kill @e[type=minecraft:text_display,distance=..6]

# [ Join / Leave ] - toggles the clicker's roster membership while idle
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:interaction ~1 ~1 ~ {width:1.2f,height:2.0f,Tags:["hs_btn","hs_btn_join"],tags:["hs_btn","hs_btn_join"]}
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:text_display ~1 ~2.6 ~ {text:{text:"[ Join ]",color:"green",bold:true},billboard:"center",background:1610612736,Tags:["hs_label_join"],tags:["hs_label_join"]}

# [ Start Round ] - only a joined player may press it, and only with 2+ participants
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:interaction ~-1 ~1 ~ {width:1.2f,height:2.0f,Tags:["hs_btn","hs_btn_start"],tags:["hs_btn","hs_btn_start"]}
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:text_display ~-1 ~2.6 ~ {text:{text:"[ Start Round ]",color:"green",bold:true},billboard:"center",background:1610612736,Tags:["hs_label_start"],tags:["hs_label_start"]}

# [ + Dummy ] - setup mode only
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:interaction ~-3 ~1 ~ {width:1.2f,height:2.0f,Tags:["hs_btn","hs_btn_add"],tags:["hs_btn","hs_btn_add"]}
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:text_display ~-3 ~2.6 ~ {text:{text:"[ + Dummy ]",color:"aqua"},billboard:"center",background:1610612736,Tags:["hs_label_add"],tags:["hs_label_add"]}

# [ - Dummy ] - setup mode only
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:interaction ~-5 ~1 ~ {width:1.2f,height:2.0f,Tags:["hs_btn","hs_btn_remove"],tags:["hs_btn","hs_btn_remove"]}
execute at @n[type=minecraft:marker,tag=spawn_staging] run summon minecraft:text_display ~-5 ~2.6 ~ {text:{text:"[ - Dummy ]",color:"aqua"},billboard:"center",background:1610612736,Tags:["hs_label_remove"],tags:["hs_label_remove"]}

# Fresh buttons start their click counters over, so reset the baselines
function hideseek:lobby/sync_buttons
scoreboard players set #layout round 2

# Force the conditional labels to be re-applied on the next refresh
scoreboard players set #cur_start round -1
scoreboard players set #cur_dummy round -1
scoreboard players set #cur_join round -1

execute if entity @s run tellraw @s {"text":"Lobby buttons rebuilt at the staging marker.","color":"gray"}
