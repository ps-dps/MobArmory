
from ./../item import item

item(
    'blaze', 'feet', 3, 2557803,
    { 'armor': 2 },
    color=16757261, lore_count=1, durability=195,
    recipe=[
        ['weeping_vines', None, 'weeping_vines'],
        ['blaze_rod',     None, 'blaze_rod'    ],
    ]
)

function ~/player_hurt_entity:
    effect give @s glowing 10 0
