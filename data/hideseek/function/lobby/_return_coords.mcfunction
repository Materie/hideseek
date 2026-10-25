# Macro lines are expanded before command parsing. Keep this separate from
# return_home so the per-player storage can be populated just before teleporting.
$execute store success score #home_return round run tp @s $(x) $(y) $(z)
