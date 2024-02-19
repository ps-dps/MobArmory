from nbtlib import Byte

loot_table ~/ { "pools": [{ "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:furnace",
    "functions": [
        {
            "function": "minecraft:set_nbt",
            "tag": "{CustomModelData:2557800,BlockEntityTag:{Items:[{id:\"minecraft:stone\",Count:1b,Slot:0b,tag:{smithed:{block:{id:\"psmoba:crafter\"}}}}]}}"
        },
        {
            "function": "minecraft:set_name",
            "name": { "translate": "psmoba.crafter.title", "color": "white", "italic": false }
        }
    ]
}]}]}


function ~/place:
    align xyz run summon item_display ~.5 ~1 ~.5 {
        item:{id:"minecraft:furnace",Count:1b,tag:{CustomModelData:2557800}},
        Tags:["psmoba.crafter","psmoba.crafter.place"],
        transformation:{
            right_rotation: [0f,0f,0f,1f],
            left_rotation: [0f,0f,0f,1f],
            translation: [0f,-.5f,0f],
            scale: [1.004f,1.004f,1.004f],
        },
    }
    setblock ~ ~ ~ barrel{
        CustomName: '["",{"text": "-b+", "font": "psmoba:gui", "color": "white"},{"translate": "psmoba.crafter.title"}]',
    }
    align xyz positioned ~.5 ~1 ~.5 as @e[type=item_display,distance=...5,tag=psmoba.crafter.place,limit=1] function ~/../place2:
        tag @s remove psmoba.crafter.place
        scoreboard players set @s psmoba.crafter.progress 0
        function ~/../page/inventory/setup


def replace_item(slot:int, page:str = None):
    data remove storage psmoba:temp crafter.return
    raw f'data modify storage psmoba:temp crafter.return.item set from storage psmoba:temp crafter.items[{{Slot:{slot}b}}]'
    if data storage psmoba:temp crafter.return.item function ./summon_item with storage psmoba:temp crafter.return
    if page:
        raw f'data modify block ~ ~-1 ~ Items append from storage psmoba:main crafter.pages.{page}[{{Slot:{slot}b}}]'

def check_recipe(slot:int): #! MAKE IT SUPPORT 2ND ROWWW
    unless data storage psmoba:temp {crafter:{items:[{Slot: Byte(slot) ,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot{slot}:
        replace_item(slot)
        item replace block ~ ~-1 ~ f'container.{slot}' with minecraft:structure_void{CustomModelData:2557800,psmoba:{is_inventory:1b},display:{Name:'""'}}
        unless data storage psmoba:main crafter.recipes[(-slot)] return 0 #!
        data modify storage psmoba:temp crafter.recipes.recipes set value [{}]
        data modify storage psmoba:temp crafter.recipes.recipes[0] set from storage psmoba:main crafter.recipes[(-slot)]
        store result score #success psmoba.crafter function ~/../check_recipe_cost
        if score #success psmoba.crafter matches 0 return run function ~/../fail{slot}:
            say FAILED
            data modify storage psmoba:temp crafter.recipes.recipes[0].failure.Slot set value Byte(slot)
            data modify block ~ ~-1 ~ Items append from storage psmoba:temp crafter.recipes.recipes[0].failure
        data modify storage psmoba:temp crafter.recipes.recipes[0].success.Slot set value Byte(slot)
        data modify block ~ ~-1 ~ Items append from storage psmoba:temp crafter.recipes.recipes[0].success
        say SUCCESS

        # remove ingredients
        data modify storage psmoba:temp crafter.recipes.items set from entity @s item.tag.psmoba.items
        data modify storage psmoba:temp crafter.recipes.recipes set value [{}]
        data modify storage psmoba:temp crafter.recipes.recipes[0] set from storage psmoba:main crafter.recipes[(-slot)]
        # after this place the result into the items, summon_item if no space



function ~/page:
    function ~/inventory:
        function ~/setup:
            scoreboard players set @s psmoba.crafter 1
            data modify block ~ ~-1 ~ Items set from storage psmoba:main crafter.pages.inventory
            loot replace block ~ ~-1 ~ container.9 loot psmoba:crafting_bar
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
            loot replace block ~ ~-1 ~ container.9 loot psmoba:crafting_bar
            function ~/../recipes
        function ~/click:
            data modify storage psmoba:temp crafter.items set from block ~ ~-1 ~ Items
            unless data storage psmoba:temp {crafter:{items:[{Slot:0b,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot0:
                replace_item(0)
                function ~/../../inventory/setup
            unless data storage psmoba:temp {crafter:{items:[{Slot:9b,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot9:
                replace_item(9)
                loot replace block ~ ~-1 ~ container.9 loot psmoba:crafting_bar
            unless data storage psmoba:temp {crafter:{items:[{Slot:18b,tag:{psmoba:{is_inventory:1b}}}]}} return run function ~/../slot18:
                replace_item(18, 'crafting')

            for i in range(1, 27):
                if i not in [9, 18]:
                    check_recipe(i)

        function ~/recipes:
            data remove storage psmoba:temp crafter.recipes.items
            data modify storage psmoba:temp crafter.recipes.recipes set from storage psmoba:main crafter.recipes
            scoreboard players set #slot psmoba.crafter 1
            execute function ~/../check_recipes:
                store result score #success psmoba.crafter function ~/../check_recipe_cost:
                    data modify storage psmoba:temp item.item set from storage psmoba:temp crafter.recipes.recipes[-1].cost[-1]
                    data remove storage psmoba:temp crafter.recipes.recipes[-1].cost[-1]
                    store result score #count psmoba.crafter data get storage psmoba:temp item.item.psmoba.count
                    data remove storage psmoba:temp item.item.psmoba
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


function ~/tick:
    if score @s psmoba.crafter matches 1 return run function ~/../page/inventory/click
    if score @s psmoba.crafter matches 2 return run function ~/../page/crafting/click


function ~/tick1s:
    unless block ~ ~-1 ~ barrel function ~/../break
    function ~/../tick


function ~/break:
    as @e[type=item,distance=..4,nbt={Item:{tag:{psmoba:{is_inventory:1b}}}}] kill @s

    as @e[type=item,distance=..4,nbt={Item:{id:"minecraft:barrel"}}] function ~/../break2 with entity @s Item.tag.display:
        $data modify storage psmoba:temp crafter.barrel set value $(Name)
        if data storage psmoba:temp {crafter:{barrel:{extra:[{font:"psmoba:gui"}]}}} kill @s

    unless score @s psmoba.crafter matches 1 data modify storage psmoba:temp crafter.drop_items set from entity @s item.tag.psmoba.items
    unless score @s psmoba.crafter matches 1 if data storage psmoba:temp crafter.drop_items[0] function ~/../drop_inventory:
        data modify storage psmoba:temp item.item set from storage psmoba:temp crafter.drop_items[-1]
        function ./summon_item with storage psmoba:temp item
        data remove storage psmoba:temp crafter.drop_items[-1]
        if data storage psmoba:temp crafter.drop_items[0] function ~/

    loot spawn ~ ~ ~ loot ~/../

    kill @s


function ~/destroy_all:
    as @e[type=item_display,tag=psmoba.crafter] at @s setblock ~ ~-1 ~ air
    kill @e[type=item_display,tag=psmoba.crafter]
