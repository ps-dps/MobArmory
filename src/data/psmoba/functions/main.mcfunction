
append function_tag load:load {"values":["psmoba:load"]}
function ./load:
    scoreboard objectives add psmoba dummy

    scoreboard objectives add psmoba.shot_bow minecraft.used:minecraft.bow
    scoreboard objectives add psmoba.shot_crossbow minecraft.used:minecraft.crossbow

    scoreboard objectives add psmoba.jump minecraft.custom:minecraft.jump

    scoreboard objectives add psmoba.clear.levitation dummy

    scoreboard objectives add psmoba.head dummy
    scoreboard objectives add psmoba.chest dummy
    scoreboard objectives add psmoba.legs dummy
    scoreboard objectives add psmoba.feet dummy

    scoreboard objectives add psmoba.crafter dummy
    scoreboard objectives add psmoba.crafter.progress dummy

    data modify storage psmoba:main crafter.pages.inventory set value [
        {Slot:0b, Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'{"translate":"psmoba.crafter.inventory","color":"white","italic":false}'},
            CustomModelData: 2557801,
        }},
        {Slot:18b,Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'},}},
    ]

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

    data modify storage psmoba:main crafter.recipes set value [
        {
            "result": { id: "minecraft:bone_block", Count: 64b, tag: {display:{Name:'"YES 64 Bones"'}} },
            "success": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557900,display:{Name:'["",{"translate":"psmoba.crafter.craft.success","color":"gray","italic":false,"with":[{"translate":"BONEBLOCK","color":"white","italic":false}]}]'}}},
            "failure": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557901,display:{Name:'["",{"translate":"psmoba.crafter.craft.failure","color":"red","italic":false,"with":[{"translate":"BONEBLOCK","color":"white","italic":false}]}]'}}},
            "cost": [
                { id: "minecraft:bone", Count: 64},
            ],
        },
        {
            "result": { id: "minecraft:bedrock", Count: 1b, tag: {display:{Name:'"BEDrock"'}}},
            "success": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557902,display:{Name:'["",{"translate":"psmoba.crafter.craft.success","color":"gray","italic":false,"with":[{"translate":"BEDROCK","color":"white","italic":false}]}]'}}},
            "failure": {id:"minecraft:structure_void",Count:1b,tag:{psmoba:{is_inventory:1b},CustomModelData:2557903,display:{Name:'["",{"translate":"psmoba.crafter.craft.failure","color":"red","italic":false,"with":[{"translate":"BEDROCK","color":"white","italic":false}]}]'}}},
            "cost": [
                { id: "minecraft:white_bed", Count: 10},
                { id: "minecraft:stone", Count: 1 },
            ],
        },
    ]

    function ./tick


function ./tick:
    schedule function ~/ 1t replace

    as @a[scores={psmoba.shot_bow=1..}] at @s function ./shot/bow
    as @a[scores={psmoba.shot_crossbow=1..}] at @s function ./shot/crossbow

    scoreboard players remove @a[scores={psmoba.clear.levitation=1..}] psmoba.clear.levitation 1
    as @a[scores={psmoba.clear.levitation=0}] function ./clear/levitation

    as @a[scores={psmoba.chest=2}] at @s function ./phantom/chest/tick
    as @a[scores={psmoba.legs=2}] at @s function ./phantom/legs/tick

    as @a store result score @s psmoba.crafter clear @s structure_void{psmoba:{is_inventory:1b}}
    as @a[scores={psmoba.crafter=1..}] at @s as @e[type=item_display,distance=..8,tag=psmoba.crafter] at @s function ./crafter/tick


function ./summon_item:
    $summon item ~ ~ ~ {Item:$(item),Motion:[0d,.3d,0d]}
