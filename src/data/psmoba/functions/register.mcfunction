
function ~/crafter:
    function ~/inventory:
        data modify storage psmoba:main crafter.pages.inventory set value [
            {Slot:0b, Count:1b,id:"minecraft:structure_void",tag:{
                psmoba:{is_inventory:1b},
                display:{Name:'{"translate":"psmoba.crafter.inventory","color":"white","italic":false}'},
                CustomModelData: 2557801,
            }},
            {Slot:18b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
        ]


    function ~/crafting:
        data modify storage psmoba:main crafter.pages.crafting set value [
            {Slot:0b, Count:1b,id:"minecraft:structure_void",tag:{
                psmoba:{is_inventory:1b},
                display:{Name:'{"translate":"psmoba.crafter.inventory","color":"white","italic":false}'},
                CustomModelData: 2557802,
            }},
            {Slot:18b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:1b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:2b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:3b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:4b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:5b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:6b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:7b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:8b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:10b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:11b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:12b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:13b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:14b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:15b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:16b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:17b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:19b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:20b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:21b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:22b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:23b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:24b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:25b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
            {Slot:26b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
        ]


    function ~/recipes:
        data modify storage psmoba:main crafter.recipes set value [
            {
                "result": { id: "minecraft:bone_block", Count: 64b, tag: {display:{Name:'"YES 64 Bones"'}}},
                "success": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557900,display:{Name:'["",{"translate":"psmoba.crafter.craft.success","color":"gray","italic":false,"with":[{"translate":"BONEBLOCK","color":"white","italic":false}]}]'}}},
                "failure": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557901,display:{Name:'["",{"translate":"psmoba.crafter.craft.failure","color":"red","italic":false,"with":[{"translate":"BONEBLOCK","color":"white","italic":false}]}]'}}},
                "cost": [
                    { id: "minecraft:bone", psmoba: { count: 64, name: "item.minecraft.bone" }},
                ],
            },
            {
                "result": { id: "minecraft:bedrock", Count: 1b, tag: {display:{Name:'"BEDrock"'}}},
                "success": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557902,display:{Name:'["",{"translate":"psmoba.crafter.craft.success","color":"gray","italic":false,"with":[{"translate":"BEDROCK","color":"white","italic":false}]}]'}}},
                "failure": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557903,display:{Name:'["",{"translate":"psmoba.crafter.craft.failure","color":"red","italic":false,"with":[{"translate":"BEDROCK","color":"white","italic":false}]}]'}}},
                "cost": [
                    { id: "minecraft:white_bed", psmoba: { count: 10, name: "item.minecraft.white_bed" }},
                    { id: "minecraft:stone", psmoba: { count: 1, name: "item.minecraft.stone" }},
                ],
            },
        ]
