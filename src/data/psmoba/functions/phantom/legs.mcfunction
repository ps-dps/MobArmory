
loot_table ~/ {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:leather_leggings",
                    "functions": [
                        {
                            "function": "minecraft:set_nbt",
                            "tag": "{psmoba:{id:\"phantom_legs\",nid:2},display:{color:64235},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.legs\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,14],Slot:\"legs\"}]}"
                        }
                    ]
                }
            ]
        }
    ]
}

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
