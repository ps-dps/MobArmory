
from ./../item import item

item(
    'wither_skeleton', 'feet', 1, 2557801,
    { 'armor': 3, 'armor_toughness': 3 },
    color=9534584, lore_count=1, durability=429,
    recipe=[
        ['gold_block',      None,              'gold_block'     ],
        ['netherite_scrap', None,              'netherite_scrap'],
    ]
)

prepend function ./../tungsten/feet:
    if score @s psmoba.feet matches 1 effect clear @s fire_resistance

append function ./../tungsten/feet:
    if score @s psmoba.feet matches 1 effect give @s fire_resistance infinite 0 true
