
function ~/place:
    align xyz run summon item_display ~.5 ~1 ~.5 {
        item:{id:"minecraft:stone",Count:1b},
        Tags:["psmoba.crafter"],
        transformation:{
            right_rotation: [0f,0f,0f,1f],
            left_rotation: [0f,0f,0f,1f],
            translation: [0f,-.5f,0f],
            scale: [1.001f,1.001f,1.001f],
        },
    }
    setblock ~ ~ ~ barrel{
        CustomName: '"Mob Armory"',
    }
    align xyz positioned ~.5 ~1 ~.5 as @e[type=item_display,distance=...5,tag=psmoba.crafter,limit=1] function ~/../page/inventory/setup


def replace_item(slot:int, page:str = None):
    data remove storage psmoba:temp crafter.return
    raw f'data modify storage psmoba:temp crafter.return.item set from storage psmoba:temp crafter.items[{{Slot:{slot}b}}]'
    if data storage psmoba:temp crafter.return.item function ./summon_item with storage psmoba:temp crafter.return
    if page:
        raw f'data modify block ~ ~-1 ~ Items append from storage psmoba:main crafter.pages.{page}[{{Slot:{slot}b}}]'


function ~/page:
    function ~/inventory:
        function ~/setup:
            scoreboard players set @s psmoba.crafter 1
            data modify block ~ ~-1 ~ Items set from storage psmoba:main crafter.pages.inventory
            function ~/../load
        function ~/click:
            data modify storage psmoba:temp crafter.items set from block ~ ~-1 ~ Items
            unless data storage psmoba:temp {crafter:{items:[{Slot:0b,tag:{psmoba:{is_inventory:1b}}}]}} function ~/../slot0:
                replace_item(0, 'inventory')
            unless data storage psmoba:temp {crafter:{items:[{Slot:9b,tag:{psmoba:{is_inventory:1b}}}]}} function ~/../slot9:
                replace_item(9, 'inventory')
                data remove storage psmoba:temp crafter.items[{Slot:9b}]
                function ~/../save
                function ~/../../crafting/setup
            unless data storage psmoba:temp {crafter:{items:[{Slot:18b,tag:{psmoba:{is_inventory:1b}}}]}} function ~/../slot18:
                replace_item(18, 'inventory')
        function ~/save:
            data modify entity @s item.tag.psmoba.items set from storage psmoba:temp crafter.items
            data remove entity @s item.tag.psmoba.items[{tag:{psmoba:{is_inventory:1b}}}]
        function ~/load:
            data modify block ~ ~-1 ~ Items append from entity @s item.tag.psmoba.items[]

    function ~/crafting:
        function ~/setup:
            scoreboard players set @s psmoba.crafter 2
            data modify block ~ ~-1 ~ Items set from storage psmoba:main crafter.pages.crafting
            function ~/../recipes
        function ~/click:
            data modify storage psmoba:temp crafter.items set from block ~ ~-1 ~ Items
            unless data storage psmoba:temp {crafter:{items:[{Slot:0b,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot0:
                replace_item(0)
                function ~/../../inventory/setup
            unless data storage psmoba:temp {crafter:{items:[{Slot:9b,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot9:
                replace_item(9, 'crafting')
            unless data storage psmoba:temp {crafter:{items:[{Slot:18b,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot18:
                replace_item(18, 'crafting')
        function ~/recipes:
            data remove storage psmoba:temp crafter.recipes.items
            data modify storage psmoba:temp crafter.recipes.recipes set from storage psmoba:main crafter.recipes
            scoreboard players set #slot psmoba.crafter 1
            execute function ~/../check_recipes:
                store result score #success psmoba.crafter function ~/../check_recipe_cost:
                    data modify storage psmoba:temp item.item set from storage psmoba:temp crafter.recipes.recipes[-1].cost[-1]
                    data remove storage psmoba:temp crafter.recipes.recipes[-1].cost[-1]
                    store result score #count psmoba.crafter data get storage psmoba:temp item.item.Count
                    data remove storage psmoba:temp item.item.Count
                    data modify storage psmoba:temp crafter.recipes.match set value []
                    execute function ~/../copy_matching with storage psmoba:temp item:
                        $data modify storage psmoba:temp crafter.recipes.match append from entity @s item.tag.psmoba.items[$(item)].Count
                    unless data storage psmoba:temp crafter.recipes.match[0] return 0

                    scoreboard players set #tcount psmoba.crafter 0
                    execute function ~/../count_matching:
                        store result score #icount psmoba.crafter data get storage psmoba:temp crafter.recipes.match[-1]
                        scoreboard players operation #tcount psmoba.crafter += #icount psmoba.crafter
                        data remove storage psmoba:temp crafter.recipes.match[-1]
                        if data storage psmoba:temp crafter.recipes.match[0] function ~/
                    if score #tcount psmoba.crafter < #count psmoba.crafter return 0

                    unless data storage psmoba:temp crafter.recipes.recipes[-1].cost[-1] return 1
                    if data storage psmoba:temp crafter.recipes.recipes[-1].cost[-1] return run function ~/

                if score #success psmoba.crafter matches 1 data modify storage psmoba:temp crafter.recipes.items append from storage psmoba:temp crafter.recipes.recipes[-1].success
                if score #success psmoba.crafter matches 0 data modify storage psmoba:temp crafter.recipes.items append from storage psmoba:temp crafter.recipes.recipes[-1].failure
                store result storage psmoba:temp crafter.recipes.items[-1].Slot byte 1 scoreboard players get #slot psmoba.crafter
                scoreboard players add #slot psmoba.crafter 1
                if score #slot psmoba.crafter matches 8 scoreboard players set #slot psmoba.crafter 10
                if score #slot psmoba.crafter matches 17 scoreboard players set #slot psmoba.crafter 19

                data remove storage psmoba:temp crafter.recipes.recipes[-1]
                if data storage psmoba:temp crafter.recipes.recipes[0] function ~/
            data modify block ~ ~-1 ~ Items append from storage psmoba:temp crafter.recipes.items[]



        function ~/calculate_item_amounts:
            data remove storage psmoba:temp crafter.recipes.amounts
            data modify storage psmoba:temp crafter.recipes.loop set from storage psmoba:temp crafter.items
            data remove storage psmoba:temp crafter.recipes.loop[{tag:{psmoba:{is_inventory:1b}}}]
            execute function ~/loop:
                data modify storage psmoba:temp item.item set from storage psmoba:temp crafter.recipes.loop[-1]
                store result score #count psmoba.crafter data get storage psmoba:temp item.item.Count
                data remove storage psmoba:temp item.item.Count
                data remove storage psmoba:temp item.item.Slot
                store result score #has_added psmoba.crafter function ~/../add_to_count with storage psmoba:temp item:
                    $execute unless data storage psmoba:temp crafter.recipes.amounts[$(item)] run return 0
                    $execute store result score #icount psmoba.crafter run data get storage psmoba:temp crafter.recipes.amounts[$(item)].Count
                    scoreboard players operation #icount psmoba.crafter += #count psmoba.crafter
                    $execute store result storage psmoba:temp crafter.recipes.amounts[$(item)].Count int 1 run scoreboard players get #icount psmoba.crafter
                    return 1
                if score #has_added psmoba.crafter matches 0 store result storage psmoba:temp item.item.Count int 1 scoreboard players get #count psmoba.crafter
                if score #has_added psmoba.crafter matches 0 data modify storage psmoba:temp crafter.recipes.amounts append from storage psmoba:temp item.item
                
                data remove storage psmoba:temp crafter.recipes.loop[-1]
                if data storage psmoba:temp crafter.recipes.loop[0] function ~/




function ~/tick:
    execute as @a[distance=..8] store result score @s psmoba.crafter clear @s structure_void{psmoba:{is_inventory:1b}}
    unless entity @a[distance=..8, scores={psmoba.crafter=1..}] return 0

    if score @s psmoba.crafter matches 1 return run function ~/../page/inventory/click
    if score @s psmoba.crafter matches 2 return run function ~/../page/crafting/click

    # say @a[distance=..8, scores={psmoba.crafter=1..}] I STOLE
    # scoreboard players reset @a[distance=..8, scores={psmoba.crafter=1..}] psmoba.crafter


function ~/destroy_all:
    as @e[type=item_display,tag=psmoba.crafter] at @s setblock ~ ~-1 ~ air
    kill @e[type=item_display,tag=psmoba.crafter]
