
from ./../loot_table import item

item(
    'wither_skeleton', 'head', 1, 2557801,
    { 'armor': 3, 'armor_toughness': 3 },
    color=9534584, lore_count=2, durability=363,
    recipe=[
        ['coal_block', 'netherite_scrap',       'coal_block'],
        ['gold_block', 'wither_skeleton_skull', 'gold_block'],
        [None,         'netherite_scrap',       None        ],
    ]
)

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
