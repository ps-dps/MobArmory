
from ./../item import item

item(
    'phantom', 'head', 2, 2557802,
    { 'armor': 2 },
    color=64235, lore_count=1, durability=165,
    recipe=[
        ['phantom_membrane', 'iron_ingot',       'phantom_membrane'],
        ['glow_ink_sac',     'phantom_membrane', 'glow_ink_sac'    ],
    ]
)

prepend function ./../tungsten/head:
    if score @s psmoba.head matches 2 effect clear @s night_vision

append function ./../tungsten/head:
    if score @s psmoba.head matches 2 effect give @s night_vision infinite 0 true
