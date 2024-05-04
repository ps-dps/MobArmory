
from ./../item import item

item(
    'phantom', 'feet', 2, 2557802,
    { 'armor': 2 },
    color=64235, lore_count=2, durability=195,
    recipe=[
        ['feather',          None, 'feather'         ],
        ['phantom_membrane', None, 'phantom_membrane'],
        ['iron_ingot',       None, 'iron_ingot'      ],
    ]
)

prepend function ./../tungsten/feet:
    if score @s psmoba.feet matches 2 effect clear @s slow_falling

append function ./../tungsten/feet:
    if score @s psmoba.feet matches 2 effect give @s slow_falling infinite 0 true
