
loot_table ~/ {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:leather_helmet",
                    "functions": [
                        {
                            "function": "minecraft:set_nbt",
                            "tag": "{psmoba:{id:\"wither_skeleton_head\",nid:1},display:{color:12},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.head\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,12],Slot:\"head\"}]}"
                        }
                    ]
                }
            ]
        }
    ]
}

function ~/player_hurt_entity:
    if entity @s[nbt={active_effects:[{id:"minecraft:wither"}]}] on attacker effect give @s regeneration 1 2
