# Show or hide the conditional labels based on the #vis_start / #vis_dummy flags.
# An empty text component with a transparent background renders nothing.
execute if score #vis_start round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_start] {text:{text:"[ Start Round ]",color:"green",bold:true},background:1610612736}
execute if score #vis_start round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_start] {text:{text:""},background:0}
execute if score #vis_dummy round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_add] {text:{text:"[ + Dummy ]",color:"aqua"},background:1610612736}
execute if score #vis_dummy round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_add] {text:{text:""},background:0}
execute if score #vis_dummy round matches 1 run data merge entity @n[type=minecraft:text_display,tag=hs_label_remove] {text:{text:"[ - Dummy ]",color:"aqua"},background:1610612736}
execute if score #vis_dummy round matches 0 run data merge entity @n[type=minecraft:text_display,tag=hs_label_remove] {text:{text:""},background:0}
