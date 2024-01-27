
from ./../loot_table import item

loot_table ~/ item(
    'phantom', 'legs', 2,
    { 'armor': 5 },
    color=64235, lore=2
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
