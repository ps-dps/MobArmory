
loot_table ~/ {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:leather_boots",
                    "functions": [
                        {
                            "function": "minecraft:set_nbt",
                            "tag": "{psmoba:{id:\"phantom_feet\",nid:2},display:{color:64235},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.feet\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,15],Slot:\"feet\"}]}"
                        }
                    ]
                }
            ]
        }
    ]
}
