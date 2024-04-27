
from ./../loot_table import item

item(
    'phantom', 'legs', 2, 2557802,
    { 'armor': 5 },
    color=64235, lore_count=2, durability=225,
    recipe=[
        ['phantom_membrane', 'iron_ingot', 'phantom_membrane'],
        ['iron_ingot',       None,         'iron_ingot'      ],
        ['phantom_membrane', None,         'phantom_membrane'],
    ]
)

predicate ~/is_speed {
    "condition": "minecraft:any_of",
    "terms": [
        {
            "condition": "minecraft:time_check",
            "value": {
                "min": 12000,
                "max": 24000
            },
            "period": 24000
        },
        {
            "condition": "minecraft:location_check",
            "predicate": {
                "light": {
                    "light": {
                        "min": 0,
                        "max": 4
                    }
                }
            }
        }
    ]
}

function ~/tick:
    if predicate ~/../is_speed effect give @s speed 1 1 true
