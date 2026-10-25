# Show ready actions or a short explanation of what is missing.
execute if score #vis_start round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_start] {text:{text:"[ Start Round ]",color:"green",bold:true},background:1610612736}
execute if score #vis_start round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_start] {text:{text:"[ Need 2 ]",color:"yellow"},background:1610612736}
execute if score #vis_dummy round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_add] {text:{text:"[ + Dummy ]",color:"aqua"},background:1610612736}
execute if score #vis_dummy round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_add] {text:{text:"[ + Dummy: off ]",color:"gray"},background:1610612736}
execute if score #vis_dummy round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_remove] {text:{text:"[ - Dummy ]",color:"aqua"},background:1610612736}
execute if score #vis_dummy round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_remove] {text:{text:"[ - Dummy: off ]",color:"gray"},background:1610612736}
execute if score #vis_join round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_join] {text:{text:"[ Join ]",color:"green",bold:true},background:1610612736}
execute if score #vis_join round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_join] {text:{text:"[ Leave ]",color:"red",bold:true},background:1610612736}
execute if score #vis_join round matches 2 run data merge entity @n[type=minecraft:text_display,tag=hs_label_join] {text:{text:"[ Join / Leave ]",color:"yellow",bold:true},background:1610612736}
