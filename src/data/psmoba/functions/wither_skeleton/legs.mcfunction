
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
                            "tag": "{psmoba:{id:\"wither_skeleton_legs\",nid:1},display:{color:12},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.legs\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,14],Slot:\"legs\"}]}"
                        }
                    ]
                }
            ]
        }
    ]
}

function ~/player_hurt_entity:
    on attacker tag @s add psmoba.attacker
    if entity @a[distance=..10,tag=psmoba.attacker,limit=1] effect give @s wither 10 0
    on attacker tag @s remove psmoba.attacker
