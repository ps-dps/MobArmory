
predicate ~/on_fire {
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "flags": {
            "is_on_fire": true
        }
    }
}

function ~/player_hurt_entity:
    if predicate ~/../on_fire on attacker return run effect give @s regeneration 1 2
    if entity @s[nbt={active_effects:[{id:"minecraft:wither"}]}] on attacker effect give @s regeneration 1 2
