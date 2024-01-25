
loot_table ~/ {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:leather_chestplate",
                    "functions": [
                        {
                            "function": "minecraft:set_nbt",
                            "tag": "{psmoba:{id:\"wither_skeleton\",nid:1},display:{color:12},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.chest\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,13],Slot:\"chest\"}]}"
                        }
                    ]
                }
            ]
        }
    ]
}

function ~/player_hurt_entity:
    tag @s add psmoba.victim
    on attacker at @s unless entity @e[distance=..10,tag=psmoba.victim,limit=1] run return 0
    tag @s remove psmoba.victim

    effect give @s wither 10 0
