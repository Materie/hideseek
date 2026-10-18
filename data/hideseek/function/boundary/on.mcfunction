# Storage was already populated by boundary_prep at round start
function hideseek:boundary/apply with storage hideseek:tmp
# Block travel past the edge, but never deal damage
worldborder damage amount 0
