# NBT field probe for this game version - run once and paste the [probe] chat lines back.
# Run: /function hideseek:debug/tags_test    (stand in open space, 2+ blocks from any markers)
# Every summon in the pack now writes BOTH the legacy and the predicted snake_case field
# spelling, because /summon silently DROPS unknown NBT keys - that is what stripped the tags
# off the lobby buttons and caused the per-tick respawn loop. This probe verifies which
# spelling the entity codec actually accepts. Fields not listed in the output were IGNORED.

# --- entity tags (lobby buttons, dummies, spawn markers, DC markers all rely on these) ---
summon minecraft:marker ~ ~ ~ {Tags:["hs_dbg_upper"]}
summon minecraft:marker ~ ~ ~ {tags:["hs_dbg_lower"]}
execute if entity @e[type=minecraft:marker,distance=..2,tag=hs_dbg_upper] run say [probe] ACCEPTED: Tags (upper)
execute if entity @e[type=minecraft:marker,distance=..2,tag=hs_dbg_lower] run say [probe] ACCEPTED: tags (lower)
kill @e[type=minecraft:marker,distance=..2,nbt={Tags:["hs_dbg_upper"]}]
kill @e[type=minecraft:marker,distance=..2,nbt={Tags:["hs_dbg_lower"]}]
kill @e[type=minecraft:marker,distance=..2,nbt={tags:["hs_dbg_upper"]}]
kill @e[type=minecraft:marker,distance=..2,nbt={tags:["hs_dbg_lower"]}]
# (a probe marker whose tags were ignored cannot be matched - it stays behind, invisible and inert)

# --- PortalCooldown (stores the DC hider id, read back in dc/offline) ---
summon minecraft:marker ~ ~3 ~ {PortalCooldown:12345,portal_cooldown:12345}
execute positioned ~ ~3 ~ if data entity @e[type=minecraft:marker,distance=..1,limit=1,sort=nearest] PortalCooldown run say [probe] ACCEPTED: PortalCooldown (upper)
execute positioned ~ ~3 ~ if data entity @e[type=minecraft:marker,distance=..1,limit=1,sort=nearest] portal_cooldown run say [probe] ACCEPTED: portal_cooldown (lower)
execute positioned ~ ~3 ~ run kill @e[type=minecraft:marker,distance=..1,nbt={PortalCooldown:12345}]
execute positioned ~ ~3 ~ run kill @e[type=minecraft:marker,distance=..1,nbt={portal_cooldown:12345}]

# --- mob fields used by dummies and the DC husk (probe cow, gone again within the same tick) ---
summon minecraft:cow ~ ~ ~ {NoAI:1b,no_ai:1b,PersistenceRequired:1b,persistence_required:1b,CustomName:{text:"probe"},custom_name:{text:"probe"},CustomNameVisible:1b,custom_name_visible:1b}
execute if data entity @n[type=minecraft:cow,distance=..1] NoAI run say [probe] ACCEPTED: NoAI
execute if data entity @n[type=minecraft:cow,distance=..1] no_ai run say [probe] ACCEPTED: no_ai
execute if data entity @n[type=minecraft:cow,distance=..1] PersistenceRequired run say [probe] ACCEPTED: PersistenceRequired
execute if data entity @n[type=minecraft:cow,distance=..1] persistence_required run say [probe] ACCEPTED: persistence_required
execute if data entity @n[type=minecraft:cow,distance=..1] CustomName run say [probe] ACCEPTED: CustomName
execute if data entity @n[type=minecraft:cow,distance=..1] custom_name run say [probe] ACCEPTED: custom_name
execute if data entity @n[type=minecraft:cow,distance=..1] CustomNameVisible run say [probe] ACCEPTED: CustomNameVisible
execute if data entity @n[type=minecraft:cow,distance=..1] custom_name_visible run say [probe] ACCEPTED: custom_name_visible
kill @e[type=minecraft:cow,distance=..1]

say [probe] done - any field NOT listed above was IGNORED by this version
