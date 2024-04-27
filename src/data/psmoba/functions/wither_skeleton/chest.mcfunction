
from ./../item import item

item(
    'wither_skeleton', 'chest', 1, 2557801,
    { 'armor': 8, 'armor_toughness': 3 },
    color=9534584, lore_count=1, durability=528,
    recipe=[
        ['netherite_scrap', None,              'netherite_scrap'],
        ['gold_block',      'coal_block',      'gold_block'     ],
        [None,              'netherite_scrap', None             ],
    ],
)

function ~/shoot_arrow:
    on origin unless entity @s[tag=psmoba.shooter] return 0
    tag @s add psmoba.wither_skeleton.chest
    data modify entity @s Fire set value 2000s
