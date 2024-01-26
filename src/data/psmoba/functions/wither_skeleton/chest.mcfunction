
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
                            "tag": "{psmoba:{id:\"wither_skeleton_chest\",nid:1},display:{color:12},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.chest\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,13],Slot:\"chest\"}]}"
                        }
                    ]
                }
            ]
        }
    ]
}

function ~/shoot_arrow:
    on origin unless entity @s[tag=psmoba.shooter] return 0
    tag @s add psmoba.wither_skeleton.chest
    data modify entity @s Fire set value 2000s
