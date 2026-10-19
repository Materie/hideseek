# Remove the whole lobby button set. Used when the on-screen UI is switched off
# (#ui 0) or as a last-resort cleanup. The caller positions us at the staging marker.
kill @e[type=minecraft:interaction,distance=..6]
kill @e[type=minecraft:text_display,distance=..6]
