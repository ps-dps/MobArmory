
append function_tag load:load {"values":["psmoba:load"]}
function ./load:
    scoreboard objectives add psmoba dummy

    scoreboard objectives add psmoba.shot_bow minecraft.used:minecraft.bow
    scoreboard objectives add psmoba.shot_crossbow minecraft.used:minecraft.crossbow

    scoreboard objectives add psmoba.jump minecraft.custom:minecraft.jump

    scoreboard objectives add psmoba.clear.levitation dummy

    # scoreboard objectives add psmoba.mainhand dummy
    # scoreboard objectives add psmoba.offhand dummy
    scoreboard objectives add psmoba.head dummy
    scoreboard objectives add psmoba.chest dummy
    scoreboard objectives add psmoba.legs dummy
    scoreboard objectives add psmoba.feet dummy

    scoreboard objectives add psmoba.crafter dummy

    data modify storage psmoba:main crafter.pages.inventory set value [
        {Slot:0b, Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'{"translate":"psmoba.crafter.inventory","color":"white","italic":false}'},
        }},
        {Slot:9b, Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'{"translate":"psmoba.crafter.crafting","color":"white","italic":false}'},
        }},
        {Slot:18b,Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'""'},
        }},
    ]

    data modify storage psmoba:main crafter.pages.crafting set value [
        {Slot:0b, Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'{"translate":"psmoba.crafter.inventory","color":"white","italic":false}'},
        }},
        {Slot:9b, Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'{"translate":"psmoba.crafter.crafting","color":"white","italic":false}'},
        }},
        {Slot:18b,Count:1b,id:"minecraft:structure_void",tag:{
            psmoba:{is_inventory:1b},
            display:{Name:'""'},
        }},
    ]

    data modify storage psmoba:main crafter.recipes set value [
        {
            "success": { id: "minecraft:redstone_block", Count: 1b, tag: {display:{Name:'"YES 64 Bones"'}} },
            "failure": { id: "minecraft:bedrock", Count: 1b, tag: {display:{Name:'"64 Bones"'}} },
            "cost": [
                { id: "minecraft:bone", Count: 64b},
            ],
        },
        {
            "success": { id: "minecraft:redstone_block", Count: 1b, tag: {display:{Name:'"YES 120 Flesh"'}} },
            "failure": { id: "minecraft:bedrock", Count: 1b, tag: {display:{Name:'"120 Flesh"'}} },
            "cost": [
                { id: "minecraft:rotten_flesh", Count: 120b},
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

    as @e[type=item_display,tag=psmoba.crafter] at @s function ./crafter/tick


function ./summon_item:
    $summon item ~ ~ ~ {Item:$(item),PickupDelay:0,Motion:[0d,.3d,0d]}
