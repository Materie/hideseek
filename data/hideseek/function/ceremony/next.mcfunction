# Return from each branch: a reveal advances #cer_phase, so falling through would
# otherwise reveal every remaining medal in the same tick.
execute if score #cer_phase round matches 0 run return run function hideseek:ceremony/reveal_bronze
execute if score #cer_phase round matches 1 run return run function hideseek:ceremony/reveal_silver
execute if score #cer_phase round matches 2 run return run function hideseek:ceremony/reveal_gold
execute if score #cer_phase round matches 3 run function hideseek:ceremony/end
